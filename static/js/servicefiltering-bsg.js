const bsgTable = document.querySelector("#services-bsg")
const bsgRows = bsgTable.querySelectorAll("tbody tr")
const bsgFilterInput = document.querySelector("#bsg-textfilter")
const bsgFilterBtns = document.querySelectorAll("[data-bsgfilterbtn]")
const bsgFilterSets = document.querySelectorAll("#bsg-filtersets fieldset")
const bsgFilterChecks = document.querySelectorAll(".checkitem")
const bsgClearBtn = document.querySelector("#bsg-clearfilters")
const bsgCutoff = document.querySelector("#bsg-cutoff")
const bsgCutoffBtn = bsgCutoff.querySelector("button")

// Initial cutoff
function bsgTableCutoff() {
  bsgRows.forEach((row, i) => {
    if (i > 5) {
      row.hidden = true
    }
  })
}

// Hide cutoff elements
function bsgHideCutoffs() {
  bsgCutoff.hidden = true
}

// Show empty results
function bsgEmptyCheck() {
  const noMatch = document.querySelector("#bsg-nomatch")
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
      '<div id="bsg-nomatch" class="message--info pam maxw24r">No matches</div>'
    )
  }
}

// Close filter
function bsgCloseFilter() {
  const activeBtn = document.querySelector("[data-bsgfilterbtn].active")
  if (activeBtn) {
    activeBtn.classList.remove("active")
  }
  bsgFilterSets.forEach((set) => {
    set.hidden = true
    set.classList.remove("flex")
  })

  let clearFilters = true
  bsgFilterChecks.forEach((filterCheck) => {
    if (filterCheck.checked == true) {
      clearFilters = false
    }
  })
  if (clearFilters) {
    bsgClearFilters()
  }
}

// Clear all filters
function bsgClearFilters() {
  bsgHideCutoffs()

  bsgFilterChecks.forEach((filterCheck) => {
    filterCheck.checked = false
  })
  bsgRows.forEach((row) => {
    row.hidden = false
  })
  bsgFilterInput.disabled = false
  bsgFilterInput.value = ""

  bsgEmptyCheck()
  bsgClearBtn.classList.add("dn")
}

bsgClearBtn.addEventListener("click", function () {
  bsgCloseFilter()
  bsgClearFilters()
})

bsgCutoffBtn.addEventListener("click", function () {
  bsgClearFilters()
})

// Input filter
bsgFilterInput.addEventListener("keyup", function (e) {
  bsgHideCutoffs()
  const query = e.target.value.toLowerCase()
  const notEmpty = query.length >= 1
  if (notEmpty) {
    bsgClearBtn.classList.remove("dn")
  } else {
    bsgClearBtn.classList.add("dn")
  }

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

// Create object for storing active filters
let allFilters = {}
bsgFilterSets.forEach((set) => {
  allFilters[set.id] = []
})

bsgFilterBtns.forEach((filterBtn) => {
  // Toggle filterset
  filterBtn.addEventListener("click", function (e) {
    const currentFilterSet = e.target.dataset.bsgfilterbtn
    if (e.target.classList.contains("active")) {
      bsgCloseFilter()
      return
    }
    bsgCloseFilter()
    bsgClearBtn.classList.remove("dn")

    e.target.classList.add("active")
    bsgFilterInput.disabled = true

    bsgFilterSets.forEach((set) => {
      if (set.id === currentFilterSet) {
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

    const bsgSetChecks = document.querySelectorAll(
      'input[data-filter="' + currentFilterSet + '"]'
    )

    bsgSetChecks.forEach((setCheck) => {
      setCheck.addEventListener("click", function (e) {
        const filterKey = e.target.dataset.filter
        const dataFilter = '[data-filter="' + filterKey + '"]'

        let showAll = true
        let showChecked = []
        bsgSetChecks.forEach((setCheck, i) => {
          if (setCheck.checked === true) {
            showAll = false
            showChecked[i] = setCheck.value.toLowerCase()
          }
        })

        if (showAll) {
          bsgRows.forEach((row) => {
            row.hidden = false
          })
        } else {
          bsgRows.forEach((row) => {
            row.hidden = true
            showChecked.forEach((currentFilter) => {
              if (row.querySelector(dataFilter)) {
                const currentRowData = row
                  .querySelector(dataFilter)
                  .textContent.toLowerCase()
                if (currentRowData.includes(currentFilter)) {
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
const helpBtn = document.querySelector("#help-country")
const helpTxt = document.querySelector("#info-country")
function toggleHelp() {
  if (helpTxt.hidden == true) {
    helpTxt.hidden = false
  } else {
    helpTxt.hidden = true
  }
}

helpBtn.addEventListener("click", toggleHelp)

document.addEventListener("DOMContentLoaded", function () {
  bsgTableCutoff()
})
