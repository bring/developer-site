import {bringEnvFont} from "./font.js";
import bringEnvStyle from "./style.js";
import bringEnvTemplate from "./template.js";

class BringEnv extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({mode: "open"});

    let modalAttr = this.attributes.modal;
    let isModal = false;

    if(modalAttr) {
      modalAttr = modalAttr.value;
      if(modalAttr && modalAttr !== '' && modalAttr === 'true') {
        isModal = true;
      }
    }

    this.render(isModal);
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
      const modal = this.shadowRoot.querySelector(".bring-env");
      const openModalBtn = document.querySelector('[data-bring-env-open]');

      if(openModalBtn) {
        openModalBtn.addEventListener('click', () => {
          open();
        });
      }

      const closeModalBtn = modal.querySelector('[data-close-modal]');
      closeModalBtn.addEventListener('click', () => {
        close();
      });

      modal.addEventListener("click", (event) => {
        if (event.target === modal) {
          close();
        }
      })
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
      this.shadowRoot.querySelector('.bring-env').showModal();
    }

    const close = () => {
      this.shadowRoot.querySelector('.bring-env').close();
    }
  }
}

customElements.define("bring-environmental-info", BringEnv);