import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

export default class extends Controller {
  static targets = ["users"];
  static values = {
    roomId: Number,
  };

  connect() {
    console.log(this.roomIdValue);
    createConsumer().subscriptions.create(
      { channel: "NewRoundChannel", id: this.roomIdValue },
      {
        received: (data) => {
          this.usersTarget.innerHTML = data;
        },
      }
    );
    console.log(
      `Subscribed to the new round view with the room id ${this.roomIdValue}`
    );
  }
}
