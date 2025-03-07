// app/javascript/controllers/image_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "qualityInput", "imageId"];

  connect() {
    this.formTarget.addEventListener('submit', this.handleSubmit.bind(this));
  }

  handleSubmit(event) {
    event.preventDefault();
    const quality = this.qualityInputTarget.value;
    const imageId = this.imageIdTarget.value;
    window.location.href = `/images/${imageId}/compress?quality=${quality}`;
  }
}