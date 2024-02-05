import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="change-page"
export default class extends Controller {
  static targets = [
    "button",
    "elementLeft",
    "title",
    "divHidden",
    "divToHide",
    "timer",
  ];
  static values = {
    // Array containing all urls of the room associated
    // with the room_questions
    questionsArray: Array,
    // Final urls to break the loop, first goes to new_round
    // and second to ranking
    finalUrlFirst: String,
    finalUrlSecond: String,
    // for changing the header and displaying the right answer
    newTitle: String,
  };

  connect() {
    let currentPage = this.questionsArrayValue.indexOf(
      window.location.pathname,
      0
    );
    //   // Using the JS dataset attribute to know in which round
    //   // we currently are
    if (this.buttonTarget.dataset.round === "1") {
      if (currentPage + 1 === this.questionsArrayValue.length) {
        this.firstRoundTemplate(this.finalUrlFirstValue);
      } else {
        this.firstRoundTemplate(this.questionsArrayValue[currentPage + 1]);
      }
    }
    if (this.buttonTarget.dataset.round === "2") {
      if (currentPage + 1 === this.questionsArrayValue.length) {
        this.secondRoundTemplate(this.finalUrlSecondValue);
      } else {
        this.secondRoundTemplate(this.questionsArrayValue[currentPage + 1]);
      }
    }
  }

  firstRoundTemplate(url) {
    setTimeout(() => {
      this.elementLeftTarget.classList.add("is-active");
      setTimeout(() => {
        this.buttonTarget.click();
        window.location = url;
      }, 300);
    }, 20000);
  }

  secondRoundTemplate(url) {
    setTimeout(() => {
      this.buttonTarget.click();

      this.titleTarget.innerHTML = this.newTitleValue;
      this.divHiddenTarget.classList.remove("hidden");
      this.divHiddenTarget.classList.add(
        "animate__animated",
        "animate__zoomIn"
      );
      this.divToHideTarget.classList.add(
        "animate__animated",
        "animate__fadeOutDown"
      );

      setTimeout(() => {
        this.elementLeftTarget.classList.add("is-active");
        setTimeout(() => {
          window.location = url;
        }, 300);
      }, 5000);
    }, 20000);
  }

  goingNextPageFirstRound() {
    let currentPage = this.questionsArrayValue.indexOf(
      window.location.pathname,
      0
    );

    this.elementLeftTarget.classList.add("is-active");

    setTimeout(() => {
      if (currentPage + 1 === this.questionsArrayValue.length) {
        window.location = this.finalUrlFirstValue;
      } else {
        window.location = this.questionsArrayValue[currentPage + 1];
      }
    }, 300);
  }

  goingNextPageSecondRound() {
    let currentPage = this.questionsArrayValue.indexOf(
      window.location.pathname,
      0
    );

    this.titleTarget.innerHTML = this.newTitleValue;
    this.divHiddenTarget.classList.remove("hidden");
    this.divHiddenTarget.classList.add("animate__animated", "animate__zoomIn");
    this.timerTarget.classList.add("animate__animated", "animate__fadeOutDown");
    this.divToHideTarget.classList.add(
      "animate__animated",
      "animate__fadeOutDown"
    );
    this.buttonTarget.classList.add(
      "animate__animated",
      "animate__fadeOutDown"
    );

    setTimeout(() => {
      this.elementLeftTarget.classList.add("is-active");

      setTimeout(() => {
        if (currentPage + 1 === this.questionsArrayValue.length) {
          window.location = this.finalUrlSecondValue;
        } else {
          window.location = this.questionsArrayValue[currentPage + 1];
        }
      }, 300);
    }, 5000);
  }
}
