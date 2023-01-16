//Param toggle buttons
const paramToggleBtn = document.querySelectorAll(".param-toggle-btn")

paramToggleBtn.forEach((btn) => {
  btn.addEventListener("click", function () {
    const paramToggleBtnId = this.getAttribute('aria-controls')
    const paramSubLevel = document.getElementById(paramToggleBtnId)
    const paramToggleIcon = this.querySelector(".param-toggle-icon")
    let paramToggleBtnState = this.getAttribute('aria-expanded')
    paramToggleBtnState = paramToggleBtnState === 'true' ? false : true

    this.setAttribute('aria-expanded', paramToggleBtnState)
    paramSubLevel.classList.toggle("dn")
    paramToggleIcon.classList.toggle("rotate-icon-90")
  })
})

// Firefox fallback because it lacks of support for css has()
// Show toggle all on pageload if there’s more than one toggle button in schema
function showToggleAll() {
  const schemaContainerArr = document.querySelectorAll('.schema__container')
  if (schemaContainerArr) {
    schemaContainerArr.forEach((schemaContainer) => {
      const schemaToggles = schemaContainer.querySelectorAll(
        '.param-toggle-btn'
      )
      if (schemaToggles.length > 1) {
        const toggleAllContainer = schemaContainer.previousElementSibling,
          toggleAllPair = toggleAllContainer.querySelectorAll(
            'button[data-toggle-all]'
          )
        toggleAllPair.forEach((toggleAllBtn) => {
          toggleAllBtn.classList.remove('dn')
        })
      }
    })
  }
}

// Toggle all within a schema
const toggleAllArr = document.querySelectorAll('button[data-toggle-all]')

toggleAllArr.forEach((toggleAllBtn) => {
  toggleAllBtn.addEventListener('click', function () {
    const toggleType = toggleAllBtn.dataset.toggleAll,
      closestDiv = toggleAllBtn.closest('div'),
      closestSchema = closestDiv.nextElementSibling,
      toggleBtnArr = closestSchema.querySelectorAll('.param-toggle-btn')

    let expand = 'false'
    if (toggleType === 'collapse') {
      expand = 'true'
    }

    toggleBtnArr.forEach((toggleBtn) => {
      if (toggleBtn.getAttribute('aria-expanded') === expand) {
        toggleBtn.click()
      }
    })
  })
})

// oneOf and allOf
function showSelectedSchema(ofElement) {
  const elementVal = ofElement.value,
    closest = ofElement.closest("dd"),
    ofArr = Array.from(closest.children)

  ofElement.setAttribute("checked", "")
  ofArr.forEach((ofChild) => {
    if (ofChild.tagName === "DL") {
      ofChild.classList.add("dn")
      if (ofChild.dataset.ofOne === elementVal) {
        ofChild.classList.remove("dn")
      }
    }
  })
}

const oneOfRadioArr = document.querySelectorAll("input[data-one-of]")
oneOfRadioArr.forEach((radio) => {
  radio.addEventListener("change", function () {
    showSelectedSchema(radio)
  })
})

const allOfSelectArr = document.querySelectorAll("select[data-one-of]")
allOfSelectArr.forEach((select) => {
  select.addEventListener("change", function () {
    showSelectedSchema(select)
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

// Data format selects
const formatSelects = document.querySelectorAll('select[name="formats"]')
const dataTypes = document.querySelectorAll('[data-type]')

const setSelectFormat = (e) => {
  const storedFormat = localStorage.getItem("dataFormat")
  let format = e.value;

  formatSelects.forEach((f) => {
    for(let i = 0; i < f.options.length; i++) {
      //Set the format from local storage (if stored), with fallback to json or xml if something else
      if(storedFormat && (storedFormat.includes("json") || storedFormat.includes("xml"))) {
        format = storedFormat
      } else if(f.options[i].value === storedFormat) {
        format = storedFormat
      }
      //Set the selected option based on format
      if(f.options[i].value === format) {
        f.options[i].selected = true
      } else if((format.includes("json") && f.options[i].value.includes("json")) || (format.includes("xml") && f.options[i].value.includes("xml"))) {
        //Fallback for json or xml if format don't entirely match with option values
        f.options[i].selected = true
      } else if((format.includes("javascript") && !f.value.includes("javascript"))) {
        //Select none if javascript option is not present
        f.selectedIndex = -1
      } else {
        f.options[i].selected = false
      }
    }
  })
  
  dataTypes.forEach((dataType) => {
    //Display response parameters and examples based on format
    if(dataType.dataset.type === format) {
      dataType.hidden = false
    } else if((format.includes("json") && dataType.dataset.type.includes("json")) || (format.includes("xml") && dataType.dataset.type.includes("xml"))) {
      //Fallback for json or xml if format don't entirely match with example data-type
      dataType.hidden = false
    } else {
      dataType.hidden = true
    }
  })

  //Display chosen sub-example independently of chosen format
  const exampleWrapper = e.closest("div[data-example]")

  if(exampleWrapper) {
    const exampleTypes = exampleWrapper.querySelectorAll("div[data-type]")
    exampleTypes.forEach((type) => {
      const selectSub = type.querySelector("select[data-example-sub]")
      if(selectSub) {
        const examplesSub = type.querySelectorAll("div[data-example-sub]")
        switchExample(examplesSub, "exampleSub", selectSub.value)
      }
    })
  }
}

//Set the format on page load
formatSelects.forEach(setSelectFormat)

formatSelects.forEach((select) => {
  select.addEventListener("change", function(e) {
    localStorage.setItem("dataFormat",e.target.value)
    setSelectFormat(select)
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
  showToggleAll()
  // set oneOf selection if reload/backward/forward navigation
  oneOfRadioArr.forEach((radio) => {
    if (radio.checked) {
      showSelectedSchema(radio)
    } else {
      radio.removeAttribute("checked")
    }
  })
})
