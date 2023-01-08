import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  async connect() {
    const browser = await fnBrowserDetect();
    switch (browser) {
      case "chrome":
        this.element.innerHTML = "Add Clip"
        this.element.classList.add("btn-primary");
        this.element.disabled = false;
        break;
      case "safari-iphone":
        this.element.innerHTML = "Tap to paste"
        // this.element.classList.add("btn-primary");
        this.element.disabled = false;
        break;
    }

  }

  paste(event){
    Promise.all([navigator.clipboard.read()]).then((clipboardItems) => {
      this.dispatch("paste",{ detail: { content: clipboardItems }})
    })
  }
}

function fnBrowserDetect(){

  let userAgent = navigator.userAgent;
  let browserName;

  if(userAgent.match(/chrome|chromium|crios/i)){
    browserName = "chrome";
  }else if(userAgent.match(/firefox|fxios/i)){
    browserName = "firefox";
  }  else if(userAgent.match(/safari/i) && userAgent.match(/iphone/i)){
    browserName = "safari-iphone";
  }  else if(userAgent.match(/safari/i) && userAgent.match(/macintosh/i)){
    browserName = "safari";
  }else if(userAgent.match(/opr\//i)){
    browserName = "opera";
  } else if(userAgent.match(/edg/i)){
    browserName = "edge";
  }else{
    browserName="No browser detection";
  }
  return browserName;
}