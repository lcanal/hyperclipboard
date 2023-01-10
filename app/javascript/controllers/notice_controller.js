import { Controller } from "@hotwired/stimulus"
import {enter, leave} from "el-transition";

// Connects to data-controller="notice"
export default class extends Controller {
  static targets = ['window']
  connect() {
    setTimeout(() => {
      this.dismiss();
    }, 4000);
  }

  dismiss(){
    Promise.all([
        leave(this.windowTarget)
    ]).then(()=> console.log('hide'))
  }
}
