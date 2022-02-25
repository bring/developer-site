// Responses
const schemaTypeSelect = document.querySelectorAll(".schema-type-select")
schemaTypeSelect.forEach(changeType)

function changeType(type) {
  type.addEventListener("change", function () {
    const selectedOption = this.value
    const schemaTypeParent = document.querySelector(
      '[data-schematype-id="' + selectedOption + '"]'
    ).parentNode
    const schemaTypes = schemaTypeParent.querySelectorAll(
      ".schema-type-container"
    )

    schemaTypes.forEach((schema) => {
      schema.classList.add("dn")
    })

    showSelectedSchemaOption(this)
  })
}

function showSelectedSchemaOption(sel) {
  let opt
  for (let i = 0; i < sel.options.length; i++) {
    opt = sel.options[i]
    if (opt.selected === true) {
      const schemaType = opt.value
      const schemaTypeContainer = document.querySelector(
        '[data-schematype-id="' + schemaType + '"]'
      )
      schemaTypeContainer.classList.remove("dn")
      return schemaType
    }
  }
}

function showInitialSchemaType() {
  schemaTypeSelect.forEach(showSelectedSchemaOption)
}

showInitialSchemaType()

const paramToggleBtn = document.querySelectorAll(".param-toggle-btn")

paramToggleBtn.forEach((btn) => {
  btn.addEventListener("click", function () {
    const paramToggleBtnId = this.id
    const paramSubLevel = document.querySelector(
      '[data-sublevel-id="' + paramToggleBtnId + '"]'
    )
    const paramToggleIcon = this.querySelector(".param-toggle-icon")
    paramSubLevel.classList.toggle("dn")
    paramToggleIcon.classList.toggle("rotate-icon-90")
  })
})

// Examples
function switchExample(containerArr, dataAtt, id) {
  containerArr.forEach((container) => {
    if (container.dataset[dataAtt] === id) {
      container.hidden = false
    } else {
      container.hidden = true
    }
  })
}

const responseExBtns = document.querySelectorAll("button[data-response-ex]")
responseExBtns.forEach((btn) => {
  btn.addEventListener("click", function (e) {
    const element = e.target

    if (element.classList.contains("active")) {
      return
    }

    const resIdBtn = element.dataset.responseEx
    const endpointId = element.name
    const responseSection =
      document.getElementById(endpointId).nextElementSibling
    const exampleContainers = responseSection.querySelectorAll(
      "div[data-response-ex]"
    )
    const activeBtn = document.querySelector(
      'button[name="' + endpointId + '"].active'
    )
    activeBtn.classList.remove("active")
    element.classList.add("active")

    switchExample(exampleContainers, "responseEx", resIdBtn)
  })
})

const responseExSelects = document.querySelectorAll(
  "select[data-response-subex]"
)
responseExSelects.forEach((select) => {
  select.addEventListener("change", function (e) {
    const element = e.target
    const exId = element.value
    const responseSection = element.closest("div[data-response-ex]")
    const exampleSubContainers = responseSection.querySelectorAll(
      "div[data-response-subex]"
    )

    switchExample(exampleSubContainers, "responseSubex", exId)
  })
})