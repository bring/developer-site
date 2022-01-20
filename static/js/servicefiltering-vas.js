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

// Group filters
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

    const groupChecks = document.querySelectorAll(
      'input[data-filter="' + filterType + '"]'
    )

    groupChecks.forEach((groupCheck) => {
      groupCheck.addEventListener("click", function (e) {
        const filterType = e.target.dataset.filter
        const dataFilter = '[data-filter="' + filterType + '"]'

        let showAll = true
        let showChecked = []
        groupChecks.forEach((groupCheck, i) => {
          if (groupCheck.checked === true) {
            showAll = false
            showChecked[i] = groupCheck.value.toLowerCase()
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
            showChecked.forEach((show) => {
              if (![...row.querySelectorAll(".vascountry tbody tr " + dataFilter)]?.some(r => r.textContent?.toLowerCase() === show)) {
                row.classList.add("vas__item--hidden")
              } else {
                row.classList.remove("vas__item--hidden")
              }
            })
          })
          serviceCountryRows.forEach((row) => {
            row.hidden = true
            showChecked.forEach((show) => {
              if (row.querySelector(dataFilter)) {
                const rTc = row
                  .querySelector(dataFilter)
                  .textContent.toLowerCase()
                if (rTc === show) {
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
  const element = document.getElementById(targetElement);
  const headerOffset = document.querySelector('.dev-siteheader').offsetHeight + 20;
  const elementPosition = element.getBoundingClientRect().top;
  const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

  const vasBtnParent = document.getElementById(targetElement).parentElement
    
  const vasBtnToggler = vasBtnParent.querySelector('.dev-collapsible__toggler')
  vasBtnToggler.classList.remove('dev-collapsible__toggler--collapsed')
  vasBtnToggler.classList.add('dev-collapsible__toggler--expanded')

  const vasItemContent = vasBtnParent.querySelector('.dev-collapsible__item--collapsed')
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
    const cleanHashTag = anchorTag.replace(/#/,'')
    const cleanAnchorTag = cleanHashTag.replace(/%20/g, ' ')

    vasHideCutoffs()
    setTimeout(function() {
      scrollToVasTarget(cleanAnchorTag)
    },200)
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
      },200)
    })
  })

})
