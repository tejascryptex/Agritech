import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["error"]

  showError(event) {
    const [data, status, xhr] = event.detail
    this.errorTarget.innerHTML = `<div class="alert alert-danger">${data.error}</div>`
  }
}
