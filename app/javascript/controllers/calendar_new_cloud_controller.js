import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="calendar-new-cloud"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: "Y-m-d"
    })
    console.log("Alfonso")
  }
}
