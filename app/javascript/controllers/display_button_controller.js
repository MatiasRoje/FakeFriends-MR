import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="display-button"
export default class extends Controller {
  static targets = ["button"];

  connect() {}

  displayButton(event) {
    this.buttonTarget.classList.remove("invisible-button");
    this.buttonTarget.classList.add("visible-button");
  }
}
