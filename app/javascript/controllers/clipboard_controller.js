import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  connect() {
    console.log("Sup")
  }

  addClip(){
    console.log("Black widow baby")
  }
}
