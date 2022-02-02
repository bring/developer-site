const bsgTable = document.querySelector("#services-bsg")
const bsgRows = bsgTable.querySelectorAll("tbody tr")
const bsgFilterInput = document.querySelector("#bsg-textfilter")
const bsgFilterBtns = document.querySelectorAll("[data-bsgfilterbtn]")
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
function comboFilter(allFilters) {
  bsgFilterCombo.innerHTML = ""
  for (let activeFilter in allFilters) {
    if (allFilters[activeFilter].length > 0) {
      const filterTitle = document.querySelector(
        '[data-bsgfilterbtn="' + activeFilter + '"]'
      ).textContent
      let appliedFilter =
        '<button type="button" data-bsgtitle="' +
        activeFilter +
        '" class="btn-link btn-link--filter"><span data-mybicon="mybicon-cross" data-mybicon-class="icon-ui mrxs" data-mybicon-width="16" data-mybicon-height="16"></span>' +
        filterTitle +
        "</button>"
      allFilters[activeFilter].forEach((filter) => {
        appliedFilter =
          appliedFilter +
          '<button type="button"' +
          'data-bsgtype="' +
          activeFilter +
          '" data-bsgtitle="' +
          filter +
          '" class="btn-link btn-link--filter mls"><span data-mybicon="mybicon-cross" data-mybicon-class="icon-ui mrxs" data-mybicon-width="16" data-mybicon-height="16"></span>' +
          filter +
          "</button>"
      })
      bsgFilterCombo.insertAdjacentHTML("beforeend", appliedFilter)
      window.loadMybringIcons()
    }
  }
}

function toggleCheckbox(box) {
  const checkEl = document.querySelector(
    'input[data-filter="' +
      box.dataset.bsgtype +
      '"][value="' +
      box.dataset.bsgtitle +
      '"'
  )
  checkEl.click()
}

// Remove filters via combo overview
bsgFilterCombo.addEventListener("click", function (e) {
  // Delete all
  if (e.target.dataset.bsgtitle && !e.target.dataset.bsgtype) {
    let subButtons = document.querySelectorAll(
      'button[data-bsgtype="' + e.target.dataset.bsgtitle + '"]'
    )
    subButtons.forEach((subButton) => {
      toggleCheckbox(subButton)
    })
  }

  // Delete one
  if (e.target.dataset.bsgtype && e.target.dataset.bsgtitle) {
    toggleCheckbox(e.target)
  }
})

// Create object for storing active filters
allFilters = {}
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

        let activeFilterSets = 0
        for (let activeFilter in allFilters) {
          if (allFilters[activeFilter].length > 0) {
            activeFilterSets++
          }
        }

        comboFilter(allFilters)

        // Toggle table rows
        if (activeFilterSets <= 0) {
          bsgRows.forEach((row) => {
            row.hidden = false
          })
        } else {
          bsgRows.forEach((row) => {
            row.hidden = true

            // Check if row data macthes at least one active filter in each active filterset
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
