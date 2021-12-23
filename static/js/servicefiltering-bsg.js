const bsgTable = document.querySelector("#services-bsg")
const bsgRows = bsgTable.querySelectorAll("tbody tr")
const filterInput = document.querySelector("#servicefilter")
const filterBtns = document.querySelectorAll("[data-filterbtn]")
const filterSets = document.querySelectorAll("#filtersets fieldset")
const filterChecks = document.querySelectorAll("[data-check]")
const clearBtn = document.querySelector("#clearfilters")
const cutoffBsg = document.querySelector("#cutoff-bsg")
const cutoffBsgBtn = cutoffBsg.querySelector("button")

// Show empty results
function bsgEmptyCheck() {
  const noMatch = document.querySelector("#nomatch-bsg")
  let insMessage = true
  if (noMatch) {
    noMatch.remove()
    bsgTable.classList.remove("dn")
  }
  bsgRows.forEach((row) => {
    if (row.hidden === false) {
      insMessage = false
      return
    }
  })
  if (insMessage) {
    bsgTable.classList.add("dn")
    bsgTable.insertAdjacentHTML(
      "afterend",
      '<div id="nomatch-bsg" class="message--info pam maxw24r">No matches</div>'
    )
  }
}

function clearFilters() {
  hideCutoffsBsg()
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
  bsgRows.forEach((row) => {
    row.hidden = false
  })
  filterInput.disabled = false
  filterInput.value = ""

  bsgEmptyCheck()
}

clearBtn.addEventListener("click", function () {
  clearFilters()
})

cutoffBsgBtn.addEventListener("click", function () {
  clearFilters()
})

// Initial cutoff
function tableCutoffBsg() {
  bsgRows.forEach((row, i) => {
    if (i > 7) {
      row.hidden = true
    }
  })
}

// Hide cutoff elements
function hideCutoffsBsg() {
  cutoffBsg.hidden = true
}

// Input filter
filterInput.addEventListener("keyup", function (e) {
  hideCutoffsBsg()
  const query = event.target.value.toLowerCase()
  bsgRows.forEach((row) => {
    if (
      row
        .querySelector('[data-filter="name"]')
        .textContent.toLowerCase()
        .includes(query) ||
      row
        .querySelector('[data-filter="servcode"]')
        .textContent.toLowerCase()
        .includes(query) ||
      row
        .querySelector('[data-filter="reqcode"]')
        .textContent.toLowerCase()
        .includes(query)
    ) {
      row.hidden = false
    } else {
      row.hidden = true
    }
  })

  bsgEmptyCheck()
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
    filterInput.disabled = true

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
          bsgRows.forEach((row) => {
            row.hidden = false
          })
        } else {
          bsgRows.forEach((row) => {
            row.hidden = true
            showChecked.forEach((show) => {
              if (row.querySelector(dataFilter)) {
                const rTc = row
                  .querySelector(dataFilter)
                  .textContent.toLowerCase()
                if (rTc.includes(show)) {
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

// Toggle help
var helpBtn = document.querySelector("#help-country")
var helpTxt = document.querySelector("#info-country")
function toggleHelp() {
  if (helpTxt.hidden == true) {
    helpTxt.hidden = false
  } else {
    helpTxt.hidden = true
  }
}

helpBtn.addEventListener("click", toggleHelp)

document.addEventListener("DOMContentLoaded", function () {
  tableCutoffBsg()
})
