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
  // Delete all
  if (e.target.dataset.rititle && !e.target.dataset.ritype) {
    let subButtons = document.querySelectorAll(
      'button[data-ritype="' + e.target.dataset.rititle + '"]'
    )
    subButtons.forEach((subButton) => {
      toggleCheckbox(subButton)
    })
  }

  // Delete one
  if (e.target.dataset.ritype && e.target.dataset.rititle) {
    toggleCheckbox(e.target)
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
        '<button type="button" data-rititle="' +
        activeFilter +
        '" class="btn-link btn-link--filter"><span data-mybicon="mybicon-cross" data-mybicon-class="icon-ui mrxs" data-mybicon-width="16" data-mybicon-height="16"></span>' +
        filterTitle +
        '</button><div class="plm flex flex-wrap">'
      allFilters[activeFilter].forEach((filter) => {
        appliedFilter =
          appliedFilter +
          '<button type="button"' +
          'data-ritype="' +
          activeFilter +
          '" data-rititle="' +
          filter +
          '" class="btn-link btn-link--filter mrxs"><span data-mybicon="mybicon-cross" data-mybicon-class="icon-ui mrxs" data-mybicon-width="16" data-mybicon-height="16"></span>' +
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
      box.dataset.ritype +
      '"][value="' +
      box.dataset.rititle +
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
    const setOrder = ["rifamily", "riapi", "rireptype"]

    rows.forEach((row) => {
      let setInd = 0
      let hideRow = true

      if (filterKey === "rirepname") {
        const query = allFilters
        row.hidden = true
        if (row.dataset[filterKey].toLowerCase().includes(query)) {
          row.hidden = false
        }
      } else {
        setOrder.forEach((setName) => {
          const filterSet = allFilters[setName]
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
        if (row.dataset.rifamily != prevFamily) {
          setId++
        }

        if (
          row.dataset.riapi != prevApi ||
          row.dataset.rifamily != prevFamily
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
              row.dataset.riapi +
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

        if (row.dataset.rifamily != prevFamily) {
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
              row.dataset.rifamily +
              "</th>"
          )
        } else {
          rowspan++
          const sets = document.querySelectorAll('[data-ins="' + setId + '"]')
          sets.forEach((set) => {
            set.rowSpan = rowspan
          })
        }

        prevApi = row.dataset.riapi
        prevFamily = row.dataset.rifamily
      }
    })
  }
}

// Input filter
filterInput.addEventListener("keyup", function (e) {
  hideCutoffs(cutoff)
  let query = e.target.value.toLowerCase()
  const notEmpty = query.length >= 1 && query !== "-"
  const filterKey = "rirepname"
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
  filterBtn.addEventListener("click", function (e) {
    const currentFilterSet = e.target.dataset.riFilterset
    if (e.target.classList.contains("active")) {
      closeFilterSet()
      return
    }
    closeFilterSet()
    clearBtn.classList.remove("dn")

    e.target.classList.add("active")
    filterInput.disabled = true

    toggleSets(filterSets, currentFilterSet)

    const setChecks = document.querySelectorAll(
      'input[data-filter="' + currentFilterSet + '"]'
    )
    setChecks.forEach((setCheck) => {
      setCheck.addEventListener("click", function (e) {
        const filterKey = e.target.dataset.filter

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
