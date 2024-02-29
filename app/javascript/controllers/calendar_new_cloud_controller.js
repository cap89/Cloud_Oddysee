import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="calendar-new-cloud"
export default class extends Controller {
  static targets = ["start", "end"]

  // static values = {
  //   name: String,
  //   availableFrom: String,
  //   availableUntil: String,
  // }

  connect() {
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      minDate: "today"
    })
    console.log("Alfonso")
  }


}
