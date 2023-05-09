import apiUpdatesStyle from "./style.js";
import apiUpdatesTemplate from "./template.js";

class ApiSubscribe extends HTMLElement {
  constructor() {
    super();
    //this.attachShadow({mode: "open"})

    let modalAttr = this.attributes.modal;
    let isModal = false;

    if(modalAttr) {
      modalAttr = modalAttr.value;
      if(modalAttr && modalAttr !== '' && modalAttr === 'true') {
        isModal = true;
      }
    }

    this.render(isModal);

    const mcValidate = document.createElement("script");
    mcValidate.type = "text/javascript";
    mcValidate.async = true;
    mcValidate.src = "//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js";
    this.appendChild(mcValidate);

    const mcValidateFn = document.createElement("script");
    mcValidateFn.type = "text/javascript";
    mcValidateFn.innerHTML = "(function($) {window.fnames = new Array(); window.ftypes = new Array();fnames[0]='EMAIL';ftypes[0]='email';}(jQuery));var $mcj = jQuery.noConflict(true);";
    setTimeout(() => {
      this.appendChild(mcValidateFn);
    }, 300);

  }

  render(isModal) {
    const style = apiUpdatesStyle(isModal);
    const template = apiUpdatesTemplate(isModal);

    this.innerHTML = `${style} ${template}`;

    const openModalBtn = document.querySelector('[data-api-updates-open]');

    const signupForm = document.getElementById('mc-embedded-subscribe-form');
    const apiAreaRadios = signupForm.querySelectorAll('[data-api-area]');
    const apiAreas = signupForm.querySelector('.api-area-checkboxes');
    const apiAreaCheckboxes = apiAreas.querySelectorAll('input[type="checkbox"]');
    const signupSubmitBtn = document.getElementById('mc-embedded-subscribe');

    const validateCheckboxes = (e) => {
      // If second radio selected, check if at least one of the checkboxes are checked
      let someSelected = false;
      if(apiAreaRadios[1].checked) {
        const errorMessage = document.getElementById('mce-error-response');
        apiAreaCheckboxes.forEach((checkbox) => {
          if(checkbox.checked) {
            someSelected = true;
          }
        });
        if(!someSelected) {
          errorMessage.innerHTML = '';
          errorMessage.innerHTML = 'You must select at least one of the API areas.';
          errorMessage.style.display = 'block';
          e.preventDefault();
        } else {
          errorMessage.style.display = 'none';
          errorMessage.innerHTML = '';
        }
      }
    }
  
    // Toggle visibility of checkboxes based on radio checked
    apiAreaRadios.forEach((radio) => {
      radio.addEventListener('change', (e) => {
          apiAreas.classList.toggle('hidden');
          signupSubmitBtn.addEventListener('click', validateCheckboxes);
          if(e.target.checked && e.target.id === 'mce-APIAREA-0') {
            apiAreaCheckboxes.forEach((checkbox) => {
              checkbox.checked = false;
            });
            signupSubmitBtn.removeEventListener('click', validateCheckboxes);
          }
      })
    });

    // Hide the checkboxes again when the form is submitted
    signupForm.addEventListener('submit', (e) => {
      e.preventDefault();
      setTimeout(() => {
        const successMessage = document.getElementById('mce-success-response');
        if(successMessage && successMessage.innerText.length > 0) {
            apiAreas.classList.add('hidden');
            setTimeout(() => {
              successMessage.innerText = '';
              successMessage.style.display = 'none';
            }, 3000);
        }
      }, 1000);
    });

    if(isModal) {
      if(openModalBtn) {
        openModalBtn.addEventListener('click', () => {
          open();
        });
      }

      const closeModalAttr = document.querySelectorAll('[data-close-modal]');
      closeModalAttr.forEach((closeModal) => {
        closeModal.addEventListener('click', () => {
          close();
        });
      });

      this.addEventListener('keydown', (e) => {
        if (e.keyCode == 27) {
          close();
        }
      });
    }

    const open = () => {
      this.querySelector('.api-updates').classList.add('open');
      const closeModalBtn = this.querySelector('.close-modal-btn');
      if(closeModalBtn) {
        closeModalBtn.focus();
      }
    }

    const close = () => {
      this.querySelector('.api-updates').classList.remove('open');
      openModalBtn.focus();
    }
  }
}

window.addEventListener("DOMContentLoaded", () => {
  customElements.define("api-updates-subscribe", ApiSubscribe);
});