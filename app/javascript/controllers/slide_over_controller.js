import { Controller } from "@hotwired/stimulus"
import { enter, leave } from "el-transition";

// Connects to data-controller="slide-over"
export default class extends Controller {
  static targets = ["panel", "container"];

  show({ detail:  { content }}) {
    // enter(this.backdropTarget);
    // enter(this.closeButtonTarget);
    this.containerTarget.classList.remove("hidden");
    enter(this.panelTarget);
  }

  hide(){
    Promise.all([
      // leave(this.backdropTarget),
      // leave(this.containerTarget),
      leave(this.panelTarget),
    ]).then(() => {
      this.containerTarget.classList.add("hidden");
    });
  }
}
