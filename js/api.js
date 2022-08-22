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

// oneOf
function setOneOf(radio) {
  const radioVal = radio.value,
    closest = radio.closest("dd"),
    oneOfArr = Array.from(closest.children)

  radio.setAttribute("checked", "")
  oneOfArr.forEach((child) => {
    if (child.tagName === "DL") {
      child.classList.add("dn")
      if (child.dataset.ofOne === radioVal) {
        child.classList.remove("dn")
      }
    }
  })
}

const oneOfRadioArr = document.querySelectorAll("input[data-one-of]")
oneOfRadioArr.forEach((radio) => {
  radio.addEventListener("change", function () {
    setOneOf(radio)
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

//Response code buttons
const responseExBtns = document.querySelectorAll("button[data-example]")
responseExBtns.forEach((btn) => {
  btn.addEventListener("click", function (e) {
    const element = e.target

    if (element.getAttribute('aria-selected') === 'true') {
      return
    }

    const resIdBtn = element.dataset.example
    const endpointId = element.name
    const responseSection = document.getElementById(endpointId)
    const exampleContainers = responseSection.querySelectorAll("div[data-example]")
    const activeBtn = document.querySelector('button[name="' + endpointId + '"][aria-selected="true"]')
    activeBtn.setAttribute("aria-selected", false)
    element.setAttribute("aria-selected", true)

    switchExample(exampleContainers, "example", resIdBtn)
  })
})

// Format type selects
const formatSelects = document.querySelectorAll('select[name="formats"]')
formatSelects.forEach((select) => {
  select.addEventListener("change", function (e){
    const element = e.target
    const formatId = element.value

    let exampleGroup
    const parentId = element.dataset.subOf
    const parentElement = document.querySelector('div[data-example="' + parentId + '"')
    const exampleArr = parentElement.querySelectorAll('div[data-type]')
    exampleArr.forEach((example) => {
      if (example.dataset.type === formatId) {
        exampleGroup = example
        example.hidden = false
      } else {
        example.hidden = true
      }
    })

    // If multiple examples
    const subSelect = exampleGroup.querySelector('select[data-example-sub]')
    if (subSelect) {
      const subExampleArr = exampleGroup.querySelectorAll('div[data-example-sub]')
      subExampleArr.forEach((subExample) => {
        if (subExample.dataset.exampleSub === subSelect.value) {
          subExample.hidden = false
        } else {
          subExample.hidden = true
        }
      })

    }

  })
})

//Request and response examples
const exampleSelects = document.querySelectorAll(
  "select[data-example-sub]"
)
exampleSelects.forEach((select) => {
  select.addEventListener("change", function (e) {
    const element = e.target
    const exId = element.value
    const responseSection = element.closest("div[data-example]")
    const exampleSubContainers = responseSection.querySelectorAll("div[data-example-sub]")

    switchExample(exampleSubContainers, "exampleSub", exId)
  })
})

// Copy button
if('clipboard' in navigator) {
  var copyButtons = document.querySelectorAll('.copy-btn')

  if(copyButtons){
    copyButtons.forEach(btn => {
      btn.addEventListener('click', copyCode)
    })

    function copyCode() {
      const copyBtn = this
      const exampleParent = copyBtn.parentNode
      const example = exampleParent.querySelector('code').innerText

      navigator.clipboard.writeText(example)
      .then(setCopiedBtnText)

      function setCopiedBtnText() {
        copyBtn.querySelector('.copy-btn-label').innerText = "Copied"
        setTimeout(resetCopyBtnText,3000)
      }

      function resetCopyBtnText() {
        copyBtn.querySelector('.copy-btn-label').innerText = "Copy"
      }
    }
  }
}

document.addEventListener("DOMContentLoaded", function () {
  // set oneOf selection if reload/backward/forward navigation
  oneOfRadioArr.forEach((radio) => {
    if (radio.checked) {
      setOneOf(radio)
    } else {
      radio.removeAttribute("checked")
    }
  })
})
