const rows = document.querySelectorAll("#servicetable tbody tr")
const filterInput = document.querySelector("#servicefilter")
const filterBtns = document.querySelectorAll("[data-filterbtn]")
const filterSets = document.querySelectorAll("#filtersets fieldset")
const filterChecks = document.querySelectorAll("[data-check]")
const clearBtn = document.querySelector("#clearfilters")
const cutoff = document.querySelector("#cutoff")
const cutoffBtn = cutoff.querySelector("button")

function clearFilters() {
  hideCutoffs()
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
  })
  filterInput.disabled = false
  filterInput.value = ""
}

clearBtn.addEventListener("click", function () {
  clearFilters()
})

cutoffBtn.addEventListener("click", function () {
  clearFilters()
})

// Initial cutoff
function tableCutoff() {
  rows.forEach((row, i) => {
    if (i > 7) {
      row.hidden = true
    }
  })
}

// Hide cutoff elements
function hideCutoffs() {
  cutoff.hidden = true
}

// Input filter
filterInput.addEventListener("keyup", function (e) {
  hideCutoffs()
  const query = event.target.value.toLowerCase()
  rows.forEach((row) => {
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
          rows.forEach((row) => {
            row.hidden = false
          })
        } else {
          rows.forEach((row) => {
            row.hidden = true
            showChecked.forEach((show) => {
              if (row.querySelector(dataFilter)) {
                const rTc = row
                  .querySelector(dataFilter)
                  .textContent.toLowerCase()
                console.log(show, rTc)
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

document.addEventListener("DOMContentLoaded", function () {
  tableCutoff()
})
