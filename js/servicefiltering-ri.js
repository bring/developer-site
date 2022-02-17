const riTable = document.querySelector("#services-ri")
const riRows = riTable.querySelectorAll("tbody tr")
const riFilterInput = document.querySelector("#ri-textfilter")
const riFilterBtns = document.querySelectorAll("[data-rifilterbtn]")
const riFilterSets = document.querySelectorAll("#ri-filtersets fieldset")
const riFilterChecks = document.querySelectorAll(".checkitem")
const riClearBtn = document.querySelector("#ri-clearfilters")
const riFilterCombo = document.querySelector("#ri-filtercombo")
const originalEls = document.querySelectorAll(".originalel")
const riCutoff = document.querySelector("#ri-cutoff")
const riCutoffBtn = riCutoff.querySelector("button")
let allFilters

// Initial cutoff
function riTableCutoff() {
  riRows.forEach((row, i) => {
    if (i > 12) {
      row.hidden = true
    }
  })
}

// Show empty results
function riEmptyCheck() {
  const noMatch = document.querySelector("#ri-nomatch")
  let insMessage = true
  if (noMatch) {
    noMatch.remove()
    riTable.classList.remove("dn")
  }
  riRows.forEach((row) => {
    if (row.hidden === false) {
      insMessage = false
      return
    }
  })
  if (insMessage) {
    riTable.classList.add("dn")
    riTable.insertAdjacentHTML(
      "afterend",
      '<div id="ri-nomatch" class="message--info pam maxw24r">No matches</div>'
    )
  }
}

// Remove inserted cells
function removeInsCells() {
  const inserts = document.querySelectorAll("[data-ins]")
  inserts.forEach((insert) => {
    insert.remove()
  })
}

// Hide cutoff elements
function riHideCutoffs() {
  riCutoff.hidden = true
}

// Hide original elements for restoration later
function hideOriginals(bool) {
  originalEls.forEach((ogEl) => {
    ogEl.hidden = bool
  })
}

function riCloseFilter() {
  const activeBtn = document.querySelector("[data-rifilterbtn].active")

  if (activeBtn) {
    activeBtn.classList.remove("active")
  }
  riFilterSets.forEach((set) => {
    set.hidden = true
    set.classList.remove("flex")
  })

  let clearFilters = true
  riFilterChecks.forEach((filterCheck) => {
    if (filterCheck.checked == true) {
      clearFilters = false
    }
  })
  if (clearFilters) {
    riClearFilters()
  }

}

// Clear all filters
function riClearFilters() {
  riHideCutoffs()
  removeInsCells()
  hideOriginals(false)

  riFilterChecks.forEach((filterCheck) => {
    filterCheck.checked = false
  })
  riRows.forEach((row) => {
    row.hidden = false
  })
  riFilterInput.disabled = false
  riFilterInput.value = ""

  riEmptyCheck()
  allFilters = {}
  riFilterCombo.innerHTML = ""
  riClearBtn.classList.add("dn")
}

riCutoffBtn.addEventListener("click", function () {
  riCloseFilter()
  riClearFilters()
})

riClearBtn.addEventListener("click", function () {
  riClearFilters()
})

// Remove filters via combo overview
riFilterCombo.addEventListener("click", function (e) {
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
riFilterSets.forEach((set) => {
  allFilters[set.id] = []
})

// Render combofilter overview
function comboFilter(allFilters) {
  riFilterCombo.innerHTML = ""
  for (let activeFilter in allFilters) {
    if (allFilters[activeFilter].length > 0) {
      const filterTitle = document.querySelector(
        '[data-rifilterbtn="' + activeFilter + '"]'
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
      riFilterCombo.insertAdjacentHTML("beforeend", appliedFilter)
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

// Render result
function renderResult(activeFilterSets, allFilters, showAllRows, queries, filterKey) {
  removeInsCells()
  if (/*activeFilterSets <= 0 ||*/ showAllRows) {
    riRows.forEach((row) => {
      hideOriginals(false)
      row.hidden = false
    })
  } else {
    hideOriginals(true)
    let prevFamily = ""
    let setId = 0
    let count = 1
    let prevApi = ""
    let apiId = 0
    let apiCount = 1
    riRows.forEach((row) => {
      row.hidden = true

      /*
      // Check if row data matches at least one active filter in each active filterset
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
      */
        queries.forEach((query) => {
          if (row.dataset[filterKey].toLowerCase().includes(query)) {
            row.hidden = false

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
              count = 1
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
              count++
              const sets = document.querySelectorAll(
                '[data-ins="' + setId + '"]'
              )
              sets.forEach((set) => {
                set.rowSpan = count
              })
            }

            prevApi = row.dataset.riapi
            prevFamily = row.dataset.rifamily
          }
        })
      //}
    })
  }
}

// Input filter
riFilterInput.addEventListener("keyup", function (e) {
  riHideCutoffs()
  const query = e.target.value.toLowerCase()
  const notEmpty = query.length >= 1 && query !== "-"
  const filterKey = "rirepname"
  let showAllRows = true
  let queries = [""]
  if (notEmpty) {
    riClearBtn.classList.remove("dn")
    showAllRows = false
    queries = [query]
  } else {
    riClearBtn.classList.add("dn")
  }

  removeInsCells()
  renderResult(showAllRows, queries, filterKey)
  riEmptyCheck()
})

// Set filters
riFilterBtns.forEach((filterBtn) => {
  filterBtn.addEventListener("click", function (e) {
    const filterKey = e.target.dataset.rifilterbtn
    removeInsCells()
    if (e.target.classList.contains("active")) {
      riCloseFilter()
      return
    }
    riCloseFilter()
    riClearBtn.classList.remove("dn")

    e.target.classList.add("active")
    riFilterInput.disabled = true
    riFilterSets.forEach((set) => {
      if (set.id === filterKey) {
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

    const riSetChecks = document.querySelectorAll(
      'input[data-filter="' + filterKey + '"]'
    )

    riSetChecks.forEach((setCheck) => {
      setCheck.addEventListener("click", function (e) {
        const filterKey = e.target.dataset.filter

        // Store active filters
        allFilters[filterKey] = []
        riSetChecks.forEach((setCheck) => {
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

        let showAllRows = true
        let queries = []
        riSetChecks.forEach((setCheck, i) => {
          if (setCheck.checked === true) {
            showAllRows = false
            queries[i] = setCheck.value.toLowerCase()
          }
        })

        renderResult(activeFilterSets, allFilters, showAllRows, queries, filterKey)

        riEmptyCheck()
      })
    })
  })
})

document.addEventListener("DOMContentLoaded", function () {
  riTableCutoff()
})
