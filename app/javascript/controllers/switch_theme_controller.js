import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="switch-theme"
export default class extends Controller {
  static targets = ["htmlTag", "icon"];

  connect() {
    this.showTheme();
  }

  toggle() {
    const currentTheme = sessionStorage.getItem("theme");
    const isLightTheme = currentTheme === "light";

    if (isLightTheme) {
      this.setDarkTheme();
    } else {
      this.setLightTheme();
    }
  }

  setDarkTheme() {
    this.iconTarget.classList.add("fa-sun");
    this.iconTarget.classList.remove("fa-moon");
    this.htmlTagTarget.classList.add("dark");
    sessionStorage.setItem("theme", "dark");
  }

  setLightTheme() {
    this.iconTarget.classList.remove("fa-sun");
    this.iconTarget.classList.add("fa-moon");
    this.htmlTagTarget.classList.remove("dark");
    sessionStorage.setItem("theme", "light");
  }

  showTheme() {
    const currentTheme = sessionStorage.getItem("theme");

    if (currentTheme === "dark") {
      this.setDarkTheme();
    } else {
      this.setLightTheme();
    }
  }
}
