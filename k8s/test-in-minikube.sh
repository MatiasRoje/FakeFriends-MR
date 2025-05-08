#!/bin/bash
set -e

echo "🚀 Testing FakeFriends Helm Chart in Minikube"

# Check if minikube is running
if ! minikube status &>/dev/null; then
  echo "🔄 Starting Minikube..."
  minikube start
else
  echo "✅ Minikube is already running"
fi

# Set up environment for local testing
echo "🔄 Setting up environment..."
RELEASE_NAME="fakefriends"
NAMESPACE="fakefriends"
VERSION="1.0.0"
IMAGE_NAME="matiasroje/fakefriends:${VERSION}"
DB_PASSWORD="postgres"

# Build the Docker image locally
echo "🔄 Building Docker image locally..."
docker build -t $IMAGE_NAME .

# Delete the previous image if it exists in Minikube
echo "🔄 Deleting previous image in Minikube..."
minikube image ls | grep $IMAGE_NAME && minikube image rm $IMAGE_NAME

# Load the image into Minikube
echo "🔄 Loading image into Minikube..."
minikube image load $IMAGE_NAME

# Create namespace if it doesn't exist
if ! kubectl get namespace $NAMESPACE &>/dev/null; then
  echo "🔄 Creating namespace $NAMESPACE..."
  kubectl create namespace $NAMESPACE
fi

# Install PostgreSQL using Bitnami Helm chart
echo "🔄 Installing PostgreSQL..."
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm upgrade --install postgresql bitnami/postgresql \
  --namespace $NAMESPACE \
  --set auth.username=postgres-fakefriends \
  --set auth.password=$DB_PASSWORD \
  --set auth.database=rails_authentication_production \
  --set primary.service.port=5432

# Install Redis using Bitnami Helm chart
echo "🔄 Installing Redis..."
helm upgrade --install redis bitnami/redis \
  --namespace $NAMESPACE \
  --set auth.enabled=false

# Wait for PostgreSQL to be ready
echo "🔄 Waiting for PostgreSQL to be ready..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=postgresql -n $NAMESPACE --timeout=300s

# Wait for Redis to be ready
echo "🔄 Waiting for Redis to be ready..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=redis -n $NAMESPACE --timeout=300s

# Create values-override.yaml for testing
cat > values-override.yaml << EOF
image:
  repository: matiasroje/fakefriends
  tag: "${VERSION}"
  pullPolicy: Never

env:
  RAILS_ENV: development
  CLOUDINARY_URL: ""

db:
  DATABASE_URL: "postgresql://postgres-fakefriends:postgres@postgresql:5432/rails_authentication_development"
  POSTGRES_DB: rails_authentication_development
  DATABASE_HOST: postgresql
  DATABASE_USER: postgres-fakefriends
  DATABASE_PASSWORD: $DB_PASSWORD

redis:
  REDIS_HOST: redis-master
  REDIS_PORT: "6379" 
  REDIS_URL: "redis://redis-master:6379/0"

service:
  type: NodePort
  port: 3000

ingress:
  enabled: true
  hosts:
    - host: fakefriends.local
      paths:
        - path: /
          pathType: Prefix
EOF

# Install the Helm chart
echo "🔄 Installing FakeFriends Helm chart..."
helm upgrade --install $RELEASE_NAME ./helm/fakefriends/ \
  --namespace $NAMESPACE \
  --values values-override.yaml \
  --set existingSecret=$RELEASE_NAME-db-secret

# Wait for FakeFriends pod to be ready
echo "🔄 Waiting for FakeFriends pod to be ready..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=fakefriends -n $NAMESPACE --timeout=300s

# Open the service in browser
echo "🌐 Opening FakeFriends in your browser..."
echo "⏳ This may take a moment..."
minikube service $RELEASE_NAME-fakefriends -n $NAMESPACE