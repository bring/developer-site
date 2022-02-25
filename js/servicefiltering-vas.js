const rows = document.querySelectorAll("#allVas .vas__item")
const serviceCountryRows = document.querySelectorAll(".vascountry tbody tr")
const vasInput = document.querySelector("#vasfilter")
const filterBtns = document.querySelectorAll("[data-filterbtn]")
const filterSets = document.querySelectorAll("#filtersets fieldset")
const filterChecks = document.querySelectorAll("[data-check]")
const clearBtn = document.querySelector("#clearfilters")
const vasCutoff = document.querySelector("#vas-cutoff")
const showAll = document.querySelector("#showAll")

function vasTableCutoff() {
  rows.forEach((row, i) => {
    if (i > 10) {
      row.hidden = true
    }
  })
}

function vasHideCutoffs() {
  vasCutoff.hidden = true
}

function clearFilters() {
  vasHideCutoffs()
  const activeBtn = document.querySelector("[data-filterbtn].active")
  if (activeBtn) {
    activeBtn.classList.remove("active")
  }
  filterSets.forEach((set) => {
    set.hidden = true
    set.classList.remove("flex")
  })
  filterChecks.forEach((filterCheck) => {
    filterCheck.checked = false
  })
  rows.forEach((row) => {
    row.hidden = false
    row.classList.remove("vas__item--hidden")
  })
  serviceCountryRows.forEach((row) => {
    row.hidden = false
  })
  vasInput.value = ""

  clearBtn.classList.add("dn")
}

clearBtn.addEventListener("click", function () {
  clearFilters()
})

showAll.addEventListener("click", () => {
  clearFilters()
})

// Input filter
vasInput.addEventListener("keyup", function (e) {
  vasHideCutoffs()
  rows.forEach((row) => {
    row.hidden = false
  })
  const query = e.target.value.toLowerCase()
  const notEmpty = query.length >= 1
  if (notEmpty) {
    clearBtn.classList.remove("dn")
  } else {
    clearBtn.classList.add("dn")
  }

  rows.forEach((row) => {
    if (
      row
        .querySelector('[data-filter="name"]')
        ?.textContent?.toLowerCase()
        ?.includes(query) ||
      row
        .querySelector('[data-filter="sgcode"]')
        ?.textContent?.toLowerCase()
        ?.includes(query) ||
      row
        .querySelector('[data-filter="bookcode"]')
        ?.textContent?.toLowerCase()
        ?.includes(query)
    ) {
      row.classList.remove("vas__item--hidden")
    } else {
      row.classList.add("vas__item--hidden")
    }
  })
})

// Set filters
filterBtns.forEach((filterBtn) => {
  filterBtn.addEventListener("click", function (e) {
    const filterType = e.target.dataset.filterbtn

    if (e.target.classList.contains("active")) {
      clearFilters()
      return
    }

    clearFilters()
    e.target.classList.add("active")
    clearBtn.classList.remove("dn")

    filterSets.forEach((set) => {
      if (set.id === filterType) {
        if (set.hidden === false) {
          set.hidden = true
          set.classList.remove("flex")
        } else {
          set.hidden = false
          set.classList.add("flex")
        }
      } else {
        set.hidden = true
        set.classList.remove("flex")
      }
    })

    const vasSetChecks = document.querySelectorAll(
      'input[data-filter="' + filterType + '"]'
    )

    vasSetChecks.forEach((setCheck) => {
      setCheck.addEventListener("click", function (e) {
        const filterType = e.target.dataset.filter
        const dataFilter = '[data-filter="' + filterType + '"]'

        let showAll = true
        let showChecked = []
        vasSetChecks.forEach((setCheck, i) => {
          if (setCheck.checked === true) {
            showAll = false
            showChecked[i] = setCheck.value.toLowerCase()
          }
        })

        if (showAll) {
          rows.forEach((row) => {
            row.classList.remove("vas__item--hidden")
          })
          serviceCountryRows.forEach((row) => {
            row.hidden = false
          })
        } else {
          rows.forEach((row) => {
            let affectedRows = 0;
            showChecked.forEach((show) => {
              if ([...row.querySelectorAll(".vascountry tbody tr " + dataFilter)]?.some(r => r.textContent?.toLowerCase() === show)) {
                affectedRows++;
              }
            })
            if(affectedRows == 0) {
              row.classList.add("vas__item--hidden")
            } else {
              row.classList.remove("vas__item--hidden")
            }
          })
          serviceCountryRows.forEach((row) => {
            row.hidden = true
            showChecked.forEach((currentFilter) => {
              if (row.querySelector(dataFilter)) {
                const currentRowData = row
                  .querySelector(dataFilter)
                  .textContent.toLowerCase()
                if (currentRowData === currentFilter) {
                  row.hidden = false
                }
              }
            })
          })
        }
      })
    })
  })
})

function scrollToVasTarget(targetElement){
  const element = document.getElementById(targetElement)
  const headerOffset = document.querySelector('[data-siteheader]').offsetHeight + 20
  const elementPosition = element.getBoundingClientRect().top
  const offsetPosition = elementPosition + window.pageYOffset - headerOffset

  const vasBtnParent = element.parentElement
    
  const vasBtnToggler = vasBtnParent.querySelector('[data-collapse]')
  vasBtnToggler.classList.remove('dev-collapsible__toggler--collapsed')
  vasBtnToggler.classList.add('dev-collapsible__toggler--expanded')

  const vasItemContent = vasBtnParent.querySelector('[data-vas-element]')
  vasItemContent.classList.remove('dev-collapsible__item--collapsed')
  vasItemContent.classList.add('dev-collapsible__item--expanded')

  window.scrollTo({
       top: offsetPosition,
       behavior: "smooth"
  })
}

document.addEventListener("DOMContentLoaded", function () {
  const anchorTag = window.location.hash
  
  if(anchorTag) {
    const cleanAnchorTag = anchorTag.replace(/#/,'')

    vasHideCutoffs()
    //Delay added for Chrome so window.scrollTo event will be triggered
    setTimeout(function() {
      scrollToVasTarget(cleanAnchorTag)
    },100)
  } else {
    vasTableCutoff()
  }

  const anchors = document.querySelectorAll('.anchorjs-link')
  anchors.forEach(anchor => {
    anchor.addEventListener('click', function() {
      const anchorId = this.getAttribute('href')
      const anchorParent = document.getElementById(anchorId.replace(/#/,'')).getAttribute('id')
      setTimeout(function() {
        scrollToVasTarget(anchorParent)
      },100)
    })
  })

})