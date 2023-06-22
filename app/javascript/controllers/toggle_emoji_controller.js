import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-emoji"
export default class extends Controller {
  connect() {}

  toggleEmoji(event) {
    const p = event.currentTarget;

    event.currentTarget.classList.add(
      "animate__animated",
      "animate__fadeOutUpBig"
    );
    setTimeout(() => {
      p.classList.remove("animate__animated", "animate__fadeOutUpBig");
    }, 1000);
  }
}
