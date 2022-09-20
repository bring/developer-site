//Param toggle buttons
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
  // set oneOf selection if reload/backward/forward navigation
  oneOfRadioArr.forEach((radio) => {
    if (radio.checked) {
      setOneOf(radio)
    } else {
      radio.removeAttribute("checked")
    }
  })
})
