// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("DOMContentLoaded", function() {
  var toggleButton = document.getElementById("toggle-password-change");
  var passwordFields = document.getElementById("password-change-fields");

  toggleButton.addEventListener("click", function() {
    var isDisplayed = passwordFields.style.display !== "none";
    passwordFields.style.display = isDisplayed ? "none" : "block";
    toggleButton.textContent = isDisplayed ? "Change Password" : "Hide Change Password";
  });
});
