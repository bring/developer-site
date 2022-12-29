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
    
    const openModalBtn = document.querySelector('[data-bring-env-open]');

    if(isModal) {
      if(openModalBtn) {
        openModalBtn.addEventListener('click', () => {
          open();
        });
      }

      const closeModalAttr = this.shadowRoot.querySelectorAll('[data-close-modal]');
      closeModalAttr.forEach((closeModal) => {
        closeModal.addEventListener('click', () => {
          close();
        });
        closeModal.addEventListener('keydown', (e) => {
          if (e.keyCode == 27) {
            close();
          }
        });
      });
    }

    //Make some animation
    const cards = this.shadowRoot.querySelectorAll('.bring-env-card');

    let observerOptions = {
      threshold: 0.4
    }

    const observer = new IntersectionObserver(observeCards,observerOptions);

    cards.forEach((el) => {
      observer.observe(el);
    })

    function observeCards(cards) {
      cards.forEach(card => {
        if(card.isIntersecting) {
          let svg = card.target.querySelector('svg');
          svg.classList.add('visible');
        }
      })
    }

    const open = () => {
      this.shadowRoot.querySelector('.bring-env').classList.add('open');
      const closeModalBtn = this.shadowRoot.querySelector('.close-modal-btn');
      if(closeModalBtn) {
        closeModalBtn.focus();
      }
    }

    const close = () => {
      this.shadowRoot.querySelector('.bring-env').classList.remove('open');
      openModalBtn.focus();
    }
  }
}

customElements.define("bring-environmental-info", BringEnv);