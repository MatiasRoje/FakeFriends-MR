import { Controller } from "@hotwired/stimulus";
import axios from "axios";

// Connects to data-controller="chat"
export default class extends Controller {
  static targets = ["emojiInput", "emojiButton"];

  connect() {
    console.log("Chat controller connected");
  }

  selectAndSendEmoji(event) {
    const emoji = event.target.innerText;
    this.emojiInputTarget.value = emoji;
    this.emojiButtonTarget.click();
    console.log(event.currentTarget);
  }
}
