import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["start", "end"]

  static values = {
    name: String,
    availableFrom: String,
    availableUntil: String,
  }

  connect() {
    this.initFlatpickr();
  }

  initFlatpickr() {
    console.log(this.availableFromValue);
    flatpickr(this.startTarget, {
      mode: "range",
      dateFormat: "Y-m-d",
      enable: [
        {
            from: this.availableFromValue,
            to: this.availableUntilValue
        }
      ],
      showMonths: 2,
      onChange: this.updateDates.bind(this),
      onClose: this.updateEndInput.bind(this)
    });

    flatpickr(this.endTarget, {
      mode: "range",
      dateFormat: "Y-m-d",
      enable: [
        {
            from: this.availableFromValue,
            to: this.availableUntilValue
        }
      ],
      showMonths: 2,
      onChange: this.updateDates.bind(this),
      onClose: this.updateEndInput.bind(this)
    });

  }

  updateDates(selectedDates) {
    if (selectedDates.length === 2) {
      // Update the start date input
      this.startTarget.value = selectedDates[0].toISOString().substring(0, 10);

      // Update the end date input
      this.endTarget.value = selectedDates[1].toISOString().substring(0, 10);
    }
  }

  updateEndInput(selectedDates) {
    // Ensure the end date is updated when the calendar is closed
    if (selectedDates.length === 2) {
      this.endTarget.value = selectedDates[1].toISOString().substring(0, 10);
    }
  }
}
