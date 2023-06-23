import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="select-deck"
export default class extends Controller {
  static targets = ["deckButton"];

  connect() {}

  selectDeck(event) {
    this.deckButtonTargets.forEach((btn) => {
      btn.classList.add("not-selected");
    });
    event.currentTarget.classList.remove("not-selected");
    event.currentTarget.classList.add("selected");
  }
}
