import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="snake"
export default class extends Controller {
  static targets = ["canvas", "up", "down", "left", "right"];

  connect() {
    this.scale = 20;
    this.snake = null;
    this.fruit = null;

    this.init();
  }

  get canvas() {
    return this.targets.find("canvas");
  }

  get canvasWidth() {
    return this.canvas.offsetWidth;
  }

  get canvasHeight() {
    return this.canvas.offsetHeight;
  }

  init() {
    this.rows = this.canvasHeight / this.scale;
    this.columns = this.canvasWidth / this.scale;

    this.snake = new Snake(this);
    this.fruit = new Fruit(this);
    this.fruit.pickLocation();

    this.bindKeyEvents();
    this.bindClickEvents();

    setInterval(() => {
      this.clearCanvas();
      this.fruit.draw();
      this.snake.update();
      this.snake.draw();

      if (this.snake.eat(this.fruit)) {
        this.fruit.pickLocation();
      }

      this.snake.checkCollision();
    }, 250);
  }

  bindKeyEvents() {
    document.addEventListener("keydown", (event) => {
      const direction = event.key.replace("Arrow", "");
      this.snake.changeDirection(direction);
    });
  }

  bindClickEvents() {
    this.upTarget.addEventListener("click", () => {
      this.snake.changeDirection("Up");
      this.changeButtonColor(this.upTarget);
    });

    this.downTarget.addEventListener("click", () => {
      this.snake.changeDirection("Down");
      this.changeButtonColor(this.downTarget);
    });

    this.leftTarget.addEventListener("click", () => {
      this.snake.changeDirection("Left");
      this.changeButtonColor(this.leftTarget);
    });

    this.rightTarget.addEventListener("click", () => {
      this.snake.changeDirection("Right");
      this.changeButtonColor(this.rightTarget);
    });
  }

  changeButtonColor(button) {
    const originalColor = button.style.color;
    button.style.color = "#37b24d";
    button.style.transform = "scale(1.2)";

    setTimeout(() => {
      button.style.color = originalColor;
      button.style.transform = "scale(1)";
    }, 200); // change back to original color after 200ms
  }

  clearCanvas() {
    const ctx = this.canvas.getContext("2d");
    ctx.clearRect(0, 0, this.canvasWidth, this.canvasHeight);
  }
}

class Snake {
  constructor(controller) {
    this.controller = controller;
    this.x = 0;
    this.y = 0;
    this.xSpeed = 20;
    this.ySpeed = 0;
    this.total = 0;
    this.tail = [];
  }

  draw() {
    const ctx = this.controller.canvas.getContext("2d");
    ctx.fillStyle = "#FFFFFF";

    for (let i = 0; i < this.tail.length; i++) {
      ctx.fillRect(
        this.tail[i].x,
        this.tail[i].y,
        this.controller.scale,
        this.controller.scale
      );
    }

    ctx.fillRect(this.x, this.y, this.controller.scale, this.controller.scale);
  }

  eat(fruit) {
    if (this.x === fruit.x && this.y === fruit.y) {
      this.total++;
      return true;
    }
    return false;
  }

  update() {
    const ctx = this.controller.canvas.getContext("2d");

    for (let i = 0; i < this.tail.length - 1; i++) {
      this.tail[i] = this.tail[i + 1];
    }

    this.tail[this.total - 1] = { x: this.x, y: this.y };

    this.x += this.xSpeed;
    this.y += this.ySpeed;

    if (this.eat(this.controller.fruit)) {
      this.controller.fruit.pickLocation();
    }

    if (this.x >= this.controller.canvasWidth) {
      this.resetGame();
      return;
    }

    if (this.x < 0) {
      this.resetGame();
      return;
    }

    if (this.y >= this.controller.canvasHeight) {
      this.resetGame();
      return;
    }

    if (this.y < 0) {
      this.resetGame();
      return;
    }

    for (let i = 0; i < this.tail.length; i++) {
      if (this.x === this.tail[i].x && this.y === this.tail[i].y) {
        this.resetGame();
        return;
      }
    }
  }

  resetGame() {
    this.x = 0;
    this.y = 0;
    this.xSpeed = 20;
    this.ySpeed = 0;
    this.total = 0;
    this.tail = [];
    this.controller.fruit.pickLocation();
  }

  checkCollision() {
    for (let i = 0; i < this.tail.length; i++) {
      if (this.x === this.tail[i].x && this.y === this.tail[i].y) {
        this.total = 0;
        this.tail = [];
      }
    }
  }

  changeDirection(direction) {
    switch (direction) {
      case "Up":
        if (this.ySpeed !== 20) {
          this.xSpeed = 0;
          this.ySpeed = -20;
        }
        break;
      case "Down":
        if (this.ySpeed !== -20) {
          this.xSpeed = 0;
          this.ySpeed = 20;
        }
        break;
      case "Left":
        if (this.xSpeed !== 20) {
          this.xSpeed = -20;
          this.ySpeed = 0;
        }
        break;
      case "Right":
        if (this.xSpeed !== -20) {
          this.xSpeed = 20;
          this.ySpeed = 0;
        }
        break;
    }
  }
}

class Fruit {
  constructor(controller) {
    this.controller = controller;
    this.x = 0;
    this.y = 0;
  }

  pickLocation() {
    this.x =
      Math.floor(Math.random() * this.controller.rows) * this.controller.scale;
    this.y =
      Math.floor(Math.random() * this.controller.columns) *
      this.controller.scale;
  }

  draw() {
    const ctx = this.controller.canvas.getContext("2d");
    ctx.fillStyle = "#ff3152";
    ctx.fillRect(this.x, this.y, this.controller.scale, this.controller.scale);
  }
}
