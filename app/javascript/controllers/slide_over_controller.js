import {Controller} from "@hotwired/stimulus"
import {enter, leave} from "el-transition";

// Connects to data-controller="slide-over"
export default class extends Controller {
  static targets = ["panel", "backdrop", "container", "file", "description", "name", "url", "preview"];
  initialize() {
    this.boundHandleShowEvent = this.show.bind(this);
  }
  connect() {
    addEventListener("paste", this.boundHandleShowEvent)
  }

  past(){
    this.show();
  }

  async show() {
    let items = await navigator.clipboard.read();
    this.containerTarget.classList.remove("hidden");

    enter(this.panelTarget);
    enter(this.backdropTarget);

    this.nameTarget.focus();
    for (const clipboardItem of items) {
      for (const type of clipboardItem.types) {
        if (type.includes('image/')) {
          const blob = await clipboardItem.getType(type);
          this.fileTarget.src = URL.createObjectURL(blob);
          this.previewTarget.innerHTML = `<img src='${this.fileTarget.src}' >`
          let list = new DataTransfer();
          let file = new File([blob], new Date().toISOString());
          list.items.add(file);
          this.fileTarget.files = list.files;
        }
        else if (type.includes('text/plain')){
          const blob = await clipboardItem.getType(type);
          const text = await new Response(blob).text();

          if (text.includes('https://') || text.includes('http://'))
            this.urlTarget.value = text
          else
            this.descriptionTarget.value = text;
        }
      }
    }
  }

  hide(){
    Promise.all([
      leave(this.backdropTarget),
      // leave(this.containerTarget),
      leave(this.panelTarget),
    ]).then(() => {
      this.containerTarget.classList.add("hidden");
    });
  }
}
