import {Controller} from "@hotwired/stimulus"
import {enter, leave} from "el-transition";

// Connects to data-controller="slide-over"
export default class extends Controller {
  static targets = ["panel", "container", "preview", "description", "name"];

  async show({ detail:  { content }}) {

    // enter(this.backdropTarget);
    // enter(this.closeButtonTarget);
    this.containerTarget.classList.remove("hidden");
    enter(this.panelTarget);
    this.nameTarget.focus();

    for (const clipboardItem of content[0]) {
      for (const type of clipboardItem.types) {
        if (type.includes('image/')) {
          const blob = await clipboardItem.getType(type);
          this.previewTarget.src = URL.createObjectURL(blob);
        }
        else if (type.includes('text/plain')){
          const blob = await clipboardItem.getType(type);
          this.descriptionTarget.value = await new Response(blob).text();
        }
      }
    }
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
