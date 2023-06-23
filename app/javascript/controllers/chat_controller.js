import { Controller } from "@hotwired/stimulus";
import axios from "axios";

// Connects to data-controller="chat"
export default class extends Controller {
  static targets = ["emojiInput", "emojiButton"];

  connect() {
    console.log("Chat controller connected");
  }

  sendEmoji(event) {
    event.preventDefault();

    const emoji = this.emojiInputTarget.value.trim();
    const url = window.location.href;

    if (emoji) {
      axios
        .post(url, { emoji: emoji })
        .then((response) => {
          // Handle the response if needed
          console.log(response);
        })
        .catch((error) => {
          // Handle the error if needed
          console.log(error);
        });

      // Clear the emoji input field
      this.emojiInputTarget.value = "";
    }
  }

  selectEmoji(event) {
    const emoji = event.target.innerText;
    this.emojiInputTarget.value = emoji;
  }
}
