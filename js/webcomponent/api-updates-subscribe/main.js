import apiUpdatesStyle from "./style.js"
import apiUpdatesTemplate from "./template.js"

class ApiSubscribe extends HTMLElement {
  _attr(attr, def) { return this.attributes[attr] && this.attributes[attr].value || def}

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
      window.fnames = ["EMAIL"]
      window.ftypes = ["email"]
      const mcValidate = document.createElement("script")
      mcValidate.type = "text/javascript"
      mcValidate.async = true
      mcValidate.src =
        "//s3.amazonaws.com/downloads.mailchimp.com/js/mc-validate.js"
      this.appendChild(mcValidate)
      mcValidate.addEventListener("load", () => {
        window.$mcj = window.jQuery.noConflict(true)
      })
    }
  }

  open() {
    this.loadExternalScripts()
    this.querySelector(".api-updates").classList.add("open")
    const closeModalBtn = this.querySelector("[data-close-modal]")
    if (closeModalBtn) {
      closeModalBtn.focus()
    }
  }

  close() {
    const openModalBtn = document.querySelector("[data-api-updates-open]")
    this.querySelector(".api-updates").classList.remove("open")
    if (openModalBtn) {
      openModalBtn.focus()
    }
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
    const template = apiUpdatesTemplate(this.isModal, this.includeModalButton, this.modalButtonText, this.modalButtonClass)
    this.innerHTML = `${style} ${template}`

    const signupForm = document.getElementById("mc-embedded-subscribe-form")
    const apiAreaRadios = signupForm.querySelectorAll("[data-api-area]")
    const apiAreas = signupForm.querySelector(".api-area-checkboxes")
    const apiAreaCheckboxes = apiAreas.querySelectorAll(
      'input[type="checkbox"]'
    )
    const signupSubmitBtn = document.getElementById("mc-embedded-subscribe")

    const validateCheckboxes = (e) => {
      // If second radio selected, check if at least one of the checkboxes are checked
      let someSelected = false
      if (apiAreaRadios[1].checked) {
        const errorMessage = document.getElementById("mce-error-response")
        apiAreaCheckboxes.forEach((checkbox) => {
          if (checkbox.checked) {
            someSelected = true
          }
        })
        if (!someSelected) {
          errorMessage.innerText = ""
          errorMessage.innerText =
            "You must select at least one of the API areas."
          errorMessage.style.display = "block"
          e.preventDefault()
        } else {
          errorMessage.style.display = "none"
          errorMessage.innerText = ""
        }
      }
    }

    // Toggle visibility of checkboxes based on radio checked
    apiAreaRadios.forEach((radio) => {
      radio.addEventListener("change", (e) => {
        apiAreas.classList.toggle("hidden")
        signupSubmitBtn.addEventListener("click", validateCheckboxes)
        if (e.target.checked && e.target.id === "mce-APIAREA-0") {
          apiAreaCheckboxes.forEach((checkbox) => {
            checkbox.checked = false
          })
          signupSubmitBtn.removeEventListener("click", validateCheckboxes)
        }
      })
    })

    // Hide the checkboxes again when the form is submitted
    signupForm.addEventListener("submit", (e) => {
      e.preventDefault()
      setTimeout(() => {
        const successMessage = document.getElementById("mce-success-response")
        if (successMessage && successMessage.innerText.length > 0) {
          apiAreas.classList.add("hidden")
          setTimeout(() => {
            successMessage.innerText = ""
            successMessage.style.display = "none"
          }, 3000)
        }
      }, 1000)
    })

    if (this.isModal) {
      const closeModalAttr = document.querySelectorAll("[data-close-modal]")
      closeModalAttr.forEach((closeModal) => {
        closeModal.addEventListener("click", () => this.close())
      })

      this.addEventListener("keydown", (e) => {
        if (e.key === "Escape" || e.key === "Esc" || e.keyCode === 27) {
          this.close()
        }
      })
    }
  }
}

window.addEventListener("DOMContentLoaded", () => {
  customElements.define("api-updates-subscribe", ApiSubscribe)
})
