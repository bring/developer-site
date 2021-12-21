const rows = document.querySelectorAll("#allVas .vas__item")
const serviceCountryRows = document.querySelectorAll(".vascountry tbody tr")
const vasInput = document.querySelector("#vasfilter")
const filterBtns = document.querySelectorAll("[data-filterbtn]")
const filterSets = document.querySelectorAll("#filtersets fieldset")
const filterChecks = document.querySelectorAll("[data-check]")
const clearBtn = document.querySelector("#clearfilters")
const showAll = document.querySelector("#showAll")

function clearFilters() {
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
    row.classList.remove("vas__item--hidden")
  })
  serviceCountryRows.forEach((row) => {
    row.hidden = false
  })
  vasInput.value = ""
}

clearBtn.addEventListener("click", function () {
  clearFilters()
})

showAll.addEventListener("click", () => {
  clearFilters()
})

// Input filter
vasInput.addEventListener("keyup", function (e) {
  const query = e.target.value.toLowerCase()
  rows.forEach((row) => {
    if (
      row
        .querySelector('[data-filter="name"]')
        ?.textContent?.toLowerCase()
        ?.includes(query) ||
      row
        .querySelector('[data-filter="sgcode"]')
        ?.textContent?.toLowerCase()
        ?.includes(query) ||
      row
        .querySelector('[data-filter="bookcode"]')
        ?.textContent?.toLowerCase()
        ?.includes(query)
    ) {
      row.classList.remove("vas__item--hidden")
    } else {
      row.classList.add("vas__item--hidden")
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
            row.classList.remove("vas__item--hidden")
          })
          serviceCountryRows.forEach((row) => {
            row.hidden = false
          })
        } else {
          rows.forEach((row) => {
            showChecked.forEach((show) => {
              if (!row.querySelector(".vascountry tbody")?.textContent?.toLowerCase()?.includes(show)) {
                row.classList.add("vas__item--hidden")
              } else {
                row.classList.remove("vas__item--hidden")
              }
            })
          })
          serviceCountryRows.forEach((row) => {
            row.hidden = true
            showChecked.forEach((show) => {
              if (row.querySelector(dataFilter)) {
                const rTc = row
                  .querySelector(dataFilter)
                  .textContent.toLowerCase()
                console.log(show, rTc)
                if (rTc === show) {
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
