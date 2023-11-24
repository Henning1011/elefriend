import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="request"
export default class extends Controller {
  static targets = ["acceptedRequest", "rejectedRequest", "solvedRequest"]

  connect() {
    console.log("Hello")
  }

  accept() {
    this.acceptedRequestTarget.classList.add("d-none")
    this.rejectedRequestTarget.classList.add("d-none")
    this.solvedRequestTarget.classList.remove("d-none")
    this.solvedRequestTarget.classList.add("response-msg")
    this.solvedRequestTarget.innerText = "accepted"
  }

  reject() {
    this.acceptedRequestTarget.classList.add("d-none")
    this.rejectedRequestTarget.classList.add("d-none")
    this.solvedRequestTarget.classList.remove("d-none")
    this.solvedRequestTarget.classList.add("response-msg")
    this.solvedRequestTarget.innerText = "rejected"
  }
}
