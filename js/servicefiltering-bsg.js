const bsgTable = document.querySelector("#services-bsg")
const bsgRows = bsgTable.querySelectorAll("tbody tr")
const bsgFilterInput = document.querySelector("#bsg-textfilter")
const bsgFilterSetBtns = document.querySelectorAll("[data-bsg-filterset]")
const bsgFilterSets = document.querySelectorAll("#bsg-filtersets fieldset")
const bsgFilterChecks = document.querySelectorAll(".checkitem")
const bsgClearBtn = document.querySelector("#bsg-clearfilters")
const bsgFilterCombo = document.querySelector("#bsg-filtercombo")
const bsgCutoff = document.querySelector("#bsg-cutoff")
const bsgCutoffBtn = bsgCutoff.querySelector("button")
let allFilters

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
  const activeSet = document.querySelector("[data-bsg-filterset].active")
  if (activeSet) {
    activeSet.classList.remove("active")
  }
  bsgFilterSets.forEach((set) => {
    set.hidden = true
    set.classList.remove("flex")
  })

  toggleRows()
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
  allFilters = {}
  bsgFilterCombo.innerHTML = ""
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

// Render combofilter overview
function makeComboOverview(allFilters) {
  bsgFilterCombo.innerHTML = ""

  function appliedBtn(active, title) {
    return (
      '<button type="button" data-bsg-title="' +
      active +
      '" class="btn-link btn-link--filter"><span data-mybicon="mybicon-cross" data-mybicon-class="icon-ui mrxs" data-mybicon-width="16" data-mybicon-height="16"></span>' +
      title +
      "</button>"
    )
  }

  for (let activeFilter in allFilters) {
    if (allFilters[activeFilter].length > 0) {
      const filterTitle = document.querySelector(
        '[data-bsg-filterset="' + activeFilter + '"]'
      ).textContent
      let appliedFilter =
        appliedBtn(activeFilter, filterTitle) +
        '<div class="plm flex flex-wrap">'
      allFilters[activeFilter].forEach((filter) => {
        appliedFilter =
          appliedFilter +
          '<button type="button"' +
          'data-bsg-type="' +
          activeFilter +
          '" data-bsg-title="' +
          filter +
          '" class="btn-link btn-link--filter mrxs"><span data-mybicon="mybicon-cross" data-mybicon-class="icon-ui mrxs" data-mybicon-width="16" data-mybicon-height="16"></span>' +
          filter +
          "</button>"
      })
      appliedFilter = appliedFilter + "</div>"
      bsgFilterCombo.insertAdjacentHTML("beforeend", appliedFilter)
    }
    window.loadMybringIcons()
  }
}

function toggleCheckbox(box) {
  const checkEl = document.querySelector(
    'input[data-filter="' +
      box.dataset.bsgType +
      '"][value="' +
      box.dataset.bsgTitle +
      '"'
  )
  checkEl.click()
}

// Remove filters via combo overview
bsgFilterCombo.addEventListener("click", function (e) {
  if (e.target.dataset.bsgTitle && !e.target.dataset.bsgType) {
    // Sets
    let subButtons = document.querySelectorAll(
      'button[data-bsg-type="' + e.target.dataset.bsgTitle + '"]'
    )
    subButtons.forEach((subButton) => {
      toggleCheckbox(subButton)
    })
  }

  // Single subfilters
  if (e.target.dataset.bsgType && e.target.dataset.bsgTitle) {
    toggleCheckbox(e.target)
  }
})

// Create object for storing active filters
allFilters = {}
bsgFilterSets.forEach((set) => {
  allFilters[set.id] = []
})

function toggleRows() {
  let activeFilterSets = 0
  for (let activeFilter in allFilters) {
    if (allFilters[activeFilter].length > 0) {
      activeFilterSets++
      bsgFilterInput.disabled = true
      bsgFilterInput.value = ""
    }
  }

  // Clear all filtering if sets are closed and none are active
  let fsActive = false
  bsgFilterSetBtns.forEach((btn) => {
    if (btn.classList.contains("active")) {
      fsActive = true
      return
    }
  })
  if (!fsActive && activeFilterSets <= 0) {
    bsgClearFilters()
    return
  }

  // Toggle table rows
  if (activeFilterSets <= 0) {
    bsgRows.forEach((row) => {
      row.hidden = false
    })
  } else {
    bsgRows.forEach((row) => {
      row.hidden = true

      // Check if row data matches at least one active filter in each active set
      let matches = 0
      for (const activeFilter in allFilters) {
        if (allFilters[activeFilter].length > 0) {
          const currentFilters = allFilters[activeFilter]
          const rowDataAtt = '[data-filter="' + activeFilter + '"]'
          currentFilters.forEach((currentFilter) => {
            if (row.querySelector(rowDataAtt)) {
              const currentRowData = row
                .querySelector(rowDataAtt)
                .textContent.toLowerCase()
              if (currentRowData === currentFilter.toLowerCase()) {
                matches++
              }
            }
          })
        }
      }
      if (matches === activeFilterSets) {
        row.hidden = false
      }
    })
  }
}

// Filtersets
bsgFilterSetBtns.forEach((filterBtn) => {
  // Toggle filterset
  filterBtn.addEventListener("click", function (e) {
    const currentFilterSet = e.target.dataset.bsgFilterset
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

    // Register check clicks from open set
    const bsgSetChecks = document.querySelectorAll(
      'input[data-filter="' + currentFilterSet + '"]'
    )
    bsgSetChecks.forEach((setCheck) => {
      setCheck.addEventListener("click", function (e) {
        const filterKey = e.target.dataset.filter

        // Store active filters
        allFilters[filterKey] = []
        bsgSetChecks.forEach((setCheck) => {
          if (setCheck.checked === true) {
            allFilters[filterKey].push(setCheck.value)
          }
        })

        makeComboOverview(allFilters)
        toggleRows()
        bsgEmptyCheck()
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
