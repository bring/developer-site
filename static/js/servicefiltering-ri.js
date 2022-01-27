const riTable = document.querySelector("#services-ri")
const riRows = riTable.querySelectorAll("tbody tr")
const riFilterInput = document.querySelector("#ri-textfilter")
const riFilterBtns = document.querySelectorAll("[data-rifilterbtn]")
const riFilterSets = document.querySelectorAll("#ri-filtersets fieldset")
const riFilterChecks = document.querySelectorAll(".checkitem")
const riClearBtn = document.querySelector("#ri-clearfilters")
const originalEls = document.querySelectorAll(".originalel")
const riCutoff = document.querySelector("#ri-cutoff")
const riCutoffBtn = riCutoff.querySelector("button")

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

// Clear all filters
function riClearFilters() {
  riHideCutoffs()
  removeInsCells()
  hideOriginals(false)
  const activeBtn = document.querySelector("[data-rifilterbtn].active")

  if (activeBtn) {
    activeBtn.classList.remove("active")
  }
  riFilterSets.forEach((set) => {
    set.hidden = true
    set.classList.remove("flex")
  })
  riFilterChecks.forEach((filterCheck) => {
    filterCheck.checked = false
  })
  riRows.forEach((row) => {
    row.hidden = false
  })
  riFilterInput.disabled = false
  riFilterInput.value = ""

  riEmptyCheck()
  riClearBtn.classList.add("dn")
}

riCutoffBtn.addEventListener("click", function () {
  riClearFilters()
})

riClearBtn.addEventListener("click", function () {
  riClearFilters()
})

// Render result
function renderResult(showAllRows, queries, filterKey) {
  removeInsCells()
  if (showAllRows) {
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
      riClearFilters()
      return
    }
    riClearFilters()
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

        let showAllRows = true
        let queries = []
        riSetChecks.forEach((setCheck, i) => {
          if (setCheck.checked === true) {
            showAllRows = false
            queries[i] = setCheck.value.toLowerCase()
          }
        })

        renderResult(showAllRows, queries, filterKey)
      })
    })
  })
})

document.addEventListener("DOMContentLoaded", function () {
  riTableCutoff()
})
