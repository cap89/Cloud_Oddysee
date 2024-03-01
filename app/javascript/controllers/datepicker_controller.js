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
    const startInput = this.startTarget;
    const endInput = this.endTarget;

    flatpickr(startInput, {
      mode: "range",
      dateFormat: "Y-m-d",
      enable: [
        {
          from: this.availableFromValue,
          to: this.availableUntilValue
        }
      ],
      showMonths: 2,
      onChange: selectedDates => {
        this.updateDates(selectedDates, startInput, endInput);
      },
      onClose: selectedDates => {
        this.updateEndInput(selectedDates, endInput);
      }
    });

    flatpickr(endInput, {
      mode: "range",
      dateFormat: "Y-m-d",
      enable: [
        {
          from: this.availableFromValue,
          to: this.availableUntilValue
        }
      ],
      showMonths: 2,
      onChange: selectedDates => {
        this.updateDates(selectedDates, startInput, endInput);
      },
      onClose: selectedDates => {
        this.updateEndInput(selectedDates, endInput);
      }
    });
  }

  updateDates(selectedDates, startInput, endInput) {
    if (selectedDates.length === 2) {
      startInput.value = this.adjustDateForTimezoneOffset(selectedDates[0]);
      endInput.value = this.adjustDateForTimezoneOffset(selectedDates[1]);
    }
  }

  updateEndInput(selectedDates, endInput) {
    if (selectedDates.length === 2) {
      endInput.value = this.adjustDateForTimezoneOffset(selectedDates[1]);
    }
  }

  // Helper method to adjust the date for the browser's timezone offset
  adjustDateForTimezoneOffset(date) {
    const tzOffset = date.getTimezoneOffset() * 60000; // offset in milliseconds
    const adjustedDate = new Date(date - tzOffset);
    return adjustedDate.toISOString().split('T')[0];
  }
}
