# Build stage
FROM ruby:3.2.2-slim AS builder

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    nodejs \
    git \
    postgresql-client \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && \
    bundle install --jobs=4 && \
    rm -rf /usr/local/bundle/cache/*.gem && \
    find /usr/local/bundle/gems/ -name "*.c" -delete && \
    find /usr/local/bundle/gems/ -name "*.o" -delete

# Final stage
FROM ruby:3.2.2-slim

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    nodejs \
    postgresql-client \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy gems from builder stage
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
# Copy application code
COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
