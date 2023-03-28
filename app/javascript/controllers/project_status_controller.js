import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["selectStatus"]

  toggle() {
    this.selectStatusTarget.classList.toggle('hidden')
    console.log()
    this.element.classList.toggle('expanded')
  }
}
