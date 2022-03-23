import {
  cutoffRows,
  hideCutoffs,
  checkNoMatches,
  toggleSets,
} from "./servicefiltering-common"

const table = document.querySelector("#services-ri"),
  rows = table.querySelectorAll("tbody tr"),
  filterInput = document.querySelector("#ri-textfilter"),
  filterSetBtns = document.querySelectorAll("[data-ri-filterset]"),
  filterSets = document.querySelectorAll("#ri-filtersets fieldset"),
  filterChecks = document.querySelectorAll(".checkitem"),
  clearBtn = document.querySelector("#ri-clearfilters"),
  filterCombo = document.querySelector("#ri-filtercombo"),
  originalEls = document.querySelectorAll(".originalel"),
  cutoff = document.querySelector("#ri-cutoff"),
  cutoffBtn = cutoff.querySelector("button")
let allFilters

function removeInsCells() {
  const inserts = document.querySelectorAll("[data-ins]")
  inserts.forEach((insert) => {
    insert.remove()
  })
}

function hideOriginals(bool) {
  originalEls.forEach((ogEl) => {
    ogEl.hidden = bool
  })
}

function closeFilterSet() {
  const activeSet = document.querySelector("[data-ri-filterset].active")

  if (activeSet) {
    activeSet.classList.remove("active")
  }
  filterSets.forEach((set) => {
    set.hidden = true
    set.classList.remove("flex")
  })

  let clearFilters = true
  filterChecks.forEach((filterCheck) => {
    if (filterCheck.checked == true) {
      clearFilters = false
    }
  })
  if (clearFilters) {
    clearAllFilters()
  }
}

function clearAllFilters() {
  hideCutoffs(cutoff)
  removeInsCells()
  hideOriginals(false)

  filterChecks.forEach((filterCheck) => {
    filterCheck.checked = false
  })
  rows.forEach((row) => {
    row.hidden = false
  })
  filterInput.disabled = false
  filterInput.value = ""

  checkNoMatches("ri", table, rows)
  allFilters = {}
  filterCombo.innerHTML = ""
  clearBtn.classList.add("dn")
}

cutoffBtn.addEventListener("click", function () {
  closeFilterSet()
  clearAllFilters()
})

clearBtn.addEventListener("click", function () {
  closeFilterSet()
  clearAllFilters()
})

// Remove filters via combo overview
filterCombo.addEventListener("click", function (e) {
  const clicked = e.target
  if (clicked.dataset.riTitle && !clicked.dataset.riType) {
    // Sets
    let subButtons = document.querySelectorAll(
      'button[data-ri-type="' + clicked.dataset.riTitle + '"]'
    )
    subButtons.forEach((subButton) => {
      toggleCheckbox(subButton)
    })
  }

  // Single subfilters
  if (clicked.dataset.riType && clicked.dataset.riTitle) {
    toggleCheckbox(clicked)
  }
})

allFilters = {}
filterSets.forEach((set) => {
  allFilters[set.id] = []
})

function makeComboOverview(allFilters) {
  filterCombo.innerHTML = ""
  for (let activeFilter in allFilters) {
    if (allFilters[activeFilter].length > 0) {
      const filterTitle = document.querySelector(
        '[data-ri-filterset="' + activeFilter + '"]'
      ).textContent
      let appliedFilter =
        '<button type="button" data-ri-title="' +
        activeFilter +
        '" class="btn-link btn-link--filter"><span data-mybicon="mybicon-cross" data-mybicon-class="icon-ui mrxs pointev-none" data-mybicon-width="16" data-mybicon-height="16"></span>' +
        filterTitle +
        '</button><div class="plm flex flex-wrap">'
      allFilters[activeFilter].forEach((filter) => {
        appliedFilter =
          appliedFilter +
          '<button type="button"' +
          'data-ri-type="' +
          activeFilter +
          '" data-ri-title="' +
          filter +
          '" class="btn-link btn-link--filter mrxs"><span data-mybicon="mybicon-cross" data-mybicon-class="icon-ui mrxs pointev-none" data-mybicon-width="16" data-mybicon-height="16"></span>' +
          filter +
          "</button>"
      })
      appliedFilter = appliedFilter + "</div>"
      filterCombo.insertAdjacentHTML("beforeend", appliedFilter)
      window.loadMybringIcons()
    }
  }
}

function toggleCheckbox(box) {
  const checkEl = document.querySelector(
    'input[data-filter="' +
      box.dataset.riType +
      '"][value="' +
      box.dataset.riTitle +
      '"'
  )
  checkEl.click()
}

function renderResult(allFilters, showAllRows, filterKey) {
  removeInsCells()
  if (showAllRows) {
    rows.forEach((row) => {
      hideOriginals(false)
      row.hidden = false
    })
  } else {
    hideOriginals(true)
    let prevFamily = "",
      setId = 0,
      rowspan = 1,
      prevApi = "",
      apiId = 0,
      apiCount = 1
    // Always iterate in the same order
    const setOrder = ["riFamily", "riApi", "riReptype"]

    rows.forEach((row) => {
      let setInd = 0
      let hideRow = true
      if (filterKey === "riRepname") {
        const query = allFilters
        row.hidden = true
        if (row.dataset[filterKey].toLowerCase().includes(query)) {
          row.hidden = false
        }
      } else {
        setOrder.forEach((setName) => {
          const filterSet = allFilters[setName.toLowerCase()]
          if (filterSet) {
            // Show all rows before applying filters
            if (setInd === 0) {
              row.hidden = false
            }

            if (row.hidden === false) {
              let alreadyVisible = false
              filterSet.forEach((filter) => {
                // Avoid re-checking already visible rows
                if (!alreadyVisible) {
                  if (row.dataset[setName] === filter) {
                    hideRow = false
                    alreadyVisible = true
                  } else {
                    hideRow = true
                  }
                }
              })
            }
            row.hidden = hideRow
            setInd = setInd + 1
          }
        })
      }

      // Insert additional cells
      if (row.hidden === false) {
        if (row.dataset.riFamily != prevFamily) {
          setId++
        }

        if (
          row.dataset.riApi != prevApi ||
          row.dataset.riFamily != prevFamily
        ) {
          prevApi = ""
          apiId++
          apiCount = 1
          row.insertAdjacentHTML(
            "afterbegin",
            '<td data-ins="' +
              setId +
              apiId +
              '" rowspan="1"><span class="mb-badge">' +
              row.dataset.riApi +
              "</span></td>"
          )
        } else {
          apiCount++
          const apis = document.querySelectorAll(
            '[data-ins="' + setId + apiId + '"]'
          )
          apis.forEach((api) => {
            api.rowSpan = apiCount
          })
        }

        if (row.dataset.riFamily != prevFamily) {
          rowspan = 1
          row.insertAdjacentHTML(
            "afterbegin",
            '<td data-ins="' +
              setId +
              '" rowspan="1">' +
              row.dataset.cntype +
              "</td>"
          )
          row.insertAdjacentHTML(
            "afterbegin",
            '<th data-ins="' +
              setId +
              '" scope="row" rowspan="1" class="maxw20r">' +
              row.dataset.riFamily +
              "</th>"
          )
        } else {
          rowspan++
          const sets = document.querySelectorAll('[data-ins="' + setId + '"]')
          sets.forEach((set) => {
            set.rowSpan = rowspan
          })
        }

        prevApi = row.dataset.riApi
        prevFamily = row.dataset.riFamily
      }
    })
  }
}

// Input filter
filterInput.addEventListener("keyup", function () {
  hideCutoffs(cutoff)
  const query = this.value.toLowerCase()
  const notEmpty = query.length >= 1 && query !== "-"
  const filterKey = "riRepname"
  let showAllRows = true
  if (notEmpty) {
    clearBtn.classList.remove("dn")
    showAllRows = false
  } else {
    clearBtn.classList.add("dn")
  }

  renderResult(query, showAllRows, filterKey)
  checkNoMatches("ri", table, rows)
})

// Set filters
filterSetBtns.forEach((filterBtn) => {
  filterBtn.addEventListener("click", function () {
    const currentFilterSet = this.dataset.riFilterset
    if (this.classList.contains("active")) {
      closeFilterSet()
      return
    }
    closeFilterSet()
    clearBtn.classList.remove("dn")

    this.classList.add("active")
    filterInput.disabled = true

    toggleSets(filterSets, currentFilterSet)

    const setChecks = document.querySelectorAll(
      'input[data-filter="' + currentFilterSet + '"]'
    )
    setChecks.forEach((setCheck) => {
      setCheck.addEventListener("click", function () {
        const filterKey = this.dataset.filter

        // Store active filters
        allFilters[filterKey] = []
        setChecks.forEach((setCheck) => {
          if (setCheck.checked === true) {
            allFilters[filterKey].push(setCheck.value)
          }
        })

        let showAllRows = true
        for (const [k, _] of Object.entries(allFilters)) {
          if (allFilters[k].length > 0) {
            showAllRows = false
          }
        }

        makeComboOverview(allFilters)
        renderResult(allFilters, showAllRows, filterKey)
        checkNoMatches("ri", table, rows)
      })
    })
  })
})

document.addEventListener("DOMContentLoaded", function () {
  cutoffRows(rows, 12)
})
