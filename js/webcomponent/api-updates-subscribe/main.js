import apiUpdatesStyle from "./style.js"
import apiUpdatesTemplate from "./template.js"
import {loadjQuery, mainCr } from "./cr-script.js"

class ApiSubscribe extends HTMLElement {
  _attr(attr, def) {
    return (this.attributes[attr] && this.attributes[attr].value) || def
  }

  isModal = this._attr("modal") === "true"
  includeModalButton = this._attr("include-button") !== "false"
  modalButtonText = this._attr("button-text", "Register email")
  modalButtonClass = this._attr("button-class", "btn")

  constructor() {
    super()

    this.render()
    if (this.isModal) {
      this.bindOpenModalClickHandler()
    } else {
      this.loadExternalScripts()
    }

    window.ApiUpdatesSubscribeRebindOpenHandler = () =>
      this.bindOpenModalClickHandler()
    window.ApiUpdatesSubscribeOpenModal = () => this.open()
    window.ApiUpdatesSubscribeCloseModal = () => this.close()
  }

  externalScriptsLoaded = false
  loadExternalScripts() {
    if (!this.externalScriptsLoaded) {
      this.externalScriptsLoaded = true
      const crValidate = document.createElement("script")
      crValidate.type = "module"
      crValidate.src = "https://developer.bring.com/assets/api-updates-subscribe/cr-script.js"
      this.appendChild(crValidate)
      crValidate.addEventListener("load", () => {
        if(typeof jQuery==="undefined"){loadjQuery("//ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js",mainCr)}else{mainCr()}
      })
    }
  }

  open() {
    this.loadExternalScripts()
    this.querySelector(".api-updates").showModal()

    // Log to SiteImprove when opening the modal
    if(typeof SiteImprove !== 'undefined'){
      SiteImprove.registerEvent({
        category: 'Flow step',
        action: 'Subscribe to API updates',
        label: 'Open subscribe modal'
      })
    }
  }

  close() {
    this.querySelector(".api-updates").close()
  }

  bindOpenModalClickHandler() {
    const openModalBtns = document.querySelectorAll(
      "[data-api-updates-open]:not([data-api-updates-open-bound])"
    )

    openModalBtns.forEach((btn) => {
      btn.setAttribute("data-api-updates-open-bound", "")
      btn.addEventListener("click", (event) => {
        event.preventDefault()
        this.open()
      })
    })
  }

  render() {
    const style = apiUpdatesStyle(this.isModal)
    const template = apiUpdatesTemplate(
      this.isModal,
      this.includeModalButton,
      this.modalButtonText,
      this.modalButtonClass
    )
    this.innerHTML = `${style} ${template}`

    const signupForm = document.getElementById("cr-subscribe-form")
    const apiAreaRadios = signupForm.querySelectorAll("[data-api-area]")
    const apiAreas = signupForm.querySelector(".api-area-checkboxes")
    const apiAreaCheckboxes = apiAreas.querySelectorAll('input[type="checkbox"]')
    const errorMessage = document.getElementById("cr-error-response")

    const validateEmail = (email) => {
      if(typeof email === 'string') {
        const Regex = new RegExp(/^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/)
        if(Regex.test(email) && email.length > 3){
          return true
        }
      }
      return false
    }

    const validateInputs = (e) => {
      errorMessage.innerHTML = ''
      errorMessage.classList.add("dn")
      let someSelected = false

      // Render the error and return boolean
      const showError = (errorStatus, message) => {
        if(!errorStatus) {
          const error = document.createElement("div")
          error.innerText = message
          errorMessage.appendChild(error)
          errorMessage.classList.remove("dn")
          e.preventDefault()
        }
        return errorStatus
      }

      // If second radio selected, check if at least one of the checkboxes are checked
      if (apiAreaRadios[1].checked) {
        apiAreaCheckboxes.forEach((checkbox) => {
          if (checkbox.checked) {
            someSelected = true
          }
        })
        showError(
          someSelected,
          "You must select at least one of the API areas."
        )
      }
      
      // Check if email format is valid
      const emailInput = signupForm.querySelector('[name="email"]')
      const validEmail = validateEmail(emailInput.value)
      if(!validEmail) {
        setTimeout(() => {
          emailInput.classList.add('clever_form_error')
        },300)
        showError(
          validEmail,
          "Invalid email format!"
        )
      }

      // Log to SiteImprove when clicking Subscribe
      if(typeof SiteImprove !== 'undefined' && (apiAreaRadios[0].checked || someSelected)){
        SiteImprove.registerEvent({
          category: 'Task',
          action: 'Subscribe to API updates',
          label: 'Confirm subscription'
        })
      }
    }

    // Toggle visibility of checkboxes based on radio checked
    apiAreaRadios.forEach((radio) => {
      radio.addEventListener("change", (e) => {
        apiAreas.classList.toggle("hidden")
        apiAreaCheckboxes.forEach((checkbox) => {
          checkbox.checked = false
        })
      })
    })

    signupForm.addEventListener("submit", (e) => validateInputs(e))

    if (this.isModal) {
      const modal = this.querySelector(".api-updates")
      const closeModalAttr = modal.querySelectorAll("[data-close-modal]")
      
      closeModalAttr.forEach((closeModal) => {
        closeModal.addEventListener("click", () => this.close())
      })

      modal.addEventListener("click", (event) => {
        if (event.target === modal) {
          this.close()
        }
      })
    }
  }
}

customElements.define("api-updates-subscribe", ApiSubscribe)
