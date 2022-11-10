import {bringEnvFont} from "./font.js";
import bringEnvStyle from "./style.js";
import bringEnvTemplate from "./template.js";

class BringEnv extends HTMLElement {
  constructor() {
    super()
    this.attachShadow({mode: "open"})

    let modalAttr = this.attributes.modal;
    let isModal = false;

    if(modalAttr) {
      modalAttr = modalAttr.value;
      if(modalAttr && modalAttr !== '' && modalAttr === 'true') {
        isModal = true;
      }
    }

    this.render(isModal)
  }

  render(isModal) {
    //Appending Posten font CSS
    const font = document.createElement('style');
    font.textContent = bringEnvFont;
    this.appendChild(font);

    const style = bringEnvStyle(isModal);
    const template = bringEnvTemplate(isModal);

    this.shadowRoot.innerHTML = `${style} ${template}`;
    
    if(isModal) {
      const openModalBtn = document.querySelector('[data-bring-env-open]');
      if(openModalBtn) {
        openModalBtn.addEventListener('click', () => {
          this.open();
        });
      }

      const closeModalAttr = this.shadowRoot.querySelectorAll('[data-close-modal]');
      closeModalAttr.forEach((closeModal) => {
        closeModal.addEventListener('click', () => {
          this.close();
        });
      });
    }
  }

  open() {
    this.shadowRoot.querySelector('.bring-env').classList.add('open');
  }

  close() {
    this.shadowRoot.querySelector('.bring-env').classList.remove('open');
  }
}

customElements.define("bring-environmental-info", BringEnv);