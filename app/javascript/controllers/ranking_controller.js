import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="ranking"
export default class extends Controller {
  static targets = ["friends", "emojis"];
  static values = {
    rankingroomId: Number,
  };

  connect() {
    console.log(this.emojisTarget);
    createConsumer().subscriptions.create(
      { channel: "RankingChannel", id: this.rankingroomIdValue },
      {
        received: (data) => {
          this.friendsTarget.innerHTML = data;
        },
      }
    );
    console.log(
      `Subscribed to the ranking room with the id ${this.rankingroomIdValue}`
    );
  }
}

// { this.friendsTarget.insertAdjecentHTML("beforeend", data) }
