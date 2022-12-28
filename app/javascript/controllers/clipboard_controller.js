import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  paste(){
    this.dispatch("paste",{ detail: { content: "nothing" }})
  }
}
