const riRows = document.querySelectorAll("#services-ri tbody tr")
const riFilterInput = document.querySelector("#servicefilter-ri")
const riFilterBtns = document.querySelectorAll("[data-filterbtnri]")
const riFilterSets = document.querySelectorAll("#filtersets-ri fieldset")
const riFilterChecks = document.querySelectorAll("[data-check]")
const clearBtnRi = document.querySelector("#clearfilters-ri")
const apiBadges = document.querySelectorAll("[data-badge]")
const cutoffRi = document.querySelector("#cutoff-ri")
const cutoffRiBtn = cutoffRi.querySelector("button")

function clearFiltersRi() {
  hideCutoffsRi()
  const activeBtn = document.querySelector("[data-filterbtnri].active")
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
}

cutoffRiBtn.addEventListener("click", function () {
  clearFiltersRi()
})

clearBtnRi.addEventListener("click", function () {
  clearFiltersRi()
})

// Initial cutoff
function tableCutoffRi() {
  riRows.forEach((row, i) => {
    if (i > 12) {
      row.hidden = true
    }
  })
}

// Hide cutoff elements
function hideCutoffsRi() {
  cutoffRi.hidden = true
}

// Remove js inserted cells
function removeJsIns() {
  const jsInserts = document.querySelectorAll("[data-jsins]")
  jsInserts.forEach((insert) => {
    insert.remove()
  })
}

// Input filter
riFilterInput.addEventListener("keyup", function (e) {
  hideCutoffsRi()
  const query = e.target.value.toLowerCase()
  const len = query.length >= 1

  removeJsIns()

  riRows.forEach((row) => {
    if (len) {
      apiBadges.forEach((badge) => {
        badge.hidden = true
      })
      if (
        row
          .querySelector('[data-filter="rep-name"]')
          .textContent.toLowerCase()
          .includes(query)
      ) {
        row.hidden = false
        row.insertAdjacentHTML(
          "afterbegin",
          '<td data-jsins><span class="mb-badge mrs">' +
            row.dataset.riapi +
            "</span></td>"
        )
        row.insertAdjacentHTML(
          "afterbegin",
          "<td data-jsins>" + row.dataset.cntype + "</td>"
        )
        row.insertAdjacentHTML(
          "afterbegin",
          '<th data-jsins scope="row">' + row.dataset.rifamily + "</th>"
        )
      } else {
        row.hidden = true
      }
    } else {
      apiBadges.forEach((badge) => {
        badge.hidden = false
      })
      row.hidden = false
    }
  })
})

// Group filters
riFilterBtns.forEach((filterBtn) => {
  filterBtn.addEventListener("click", function (e) {
    const filterType = e.target.dataset.filterbtnri
    removeJsIns()

    if (e.target.classList.contains("active")) {
      clearFiltersRi()
      return
    }
    clearFiltersRi()
    e.target.classList.add("active")
    riFilterInput.disabled = true

    riFilterSets.forEach((set) => {
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

    const groupChecksRi = document.querySelectorAll(
      'input[data-filter="' + filterType + '"]'
    )

    groupChecksRi.forEach((groupCheck) => {
      groupCheck.addEventListener("click", function (e) {
        const filterType = e.target.dataset.filter.toLowerCase()

        let showAllRows = true
        let showChecked = []
        groupChecksRi.forEach((groupCheck, i) => {
          if (groupCheck.checked === true) {
            showAllRows = false
            showChecked[i] = groupCheck.value.toLowerCase()
          }
        })

        removeJsIns()
        if (showAllRows) {
          riRows.forEach((row) => {
            apiBadges.forEach((badge) => {
              badge.hidden = false
            })
            row.hidden = false
          })
        } else {
          riRows.forEach((row) => {
            row.hidden = true
            showChecked.forEach((show) => {
              if (row.dataset[filterType].toLowerCase().includes(show)) {
                row.hidden = false
                if (filterType != "rifamily" || filterType != "riapi") {
                  if (filterType != "riapi") {
                    apiBadges.forEach((badge) => {
                      badge.hidden = true
                    })
                    row.insertAdjacentHTML(
                      "afterbegin",
                      '<td data-jsins><span class="mb-badge mrs">' +
                        row.dataset.riapi +
                        "</span></td>"
                    )
                  }
                  row.insertAdjacentHTML(
                    "afterbegin",
                    "<td data-jsins>" + row.dataset.cntype + "</td>"
                  )
                  row.insertAdjacentHTML(
                    "afterbegin",
                    '<th data-jsins scope="row">' +
                      row.dataset.rifamily +
                      "</th>"
                  )
                }
              }
            })
          })
        }
      })
    })
  })
})

document.addEventListener("DOMContentLoaded", function () {
  tableCutoffRi()
})