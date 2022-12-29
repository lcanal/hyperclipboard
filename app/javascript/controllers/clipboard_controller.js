import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  paste(){
    Promise.all([navigator.clipboard.read()]).then((clipboardItems) => {
      this.dispatch("paste",{ detail: { content: clipboardItems }})
    })
  }
}
