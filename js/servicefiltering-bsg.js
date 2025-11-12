import { checkNoMatches, toggleSets } from "./servicefiltering-common"

const table = document.querySelector("#services-bsg")

if (table) {
  const rows = table.querySelectorAll("tbody tr"),
    filterInput = document.querySelector("#bsg-textfilter"),
    filterSetBtns = document.querySelectorAll("[data-bsg-filterset]"),
    filterSets = document.querySelectorAll("#bsg-filtersets fieldset"),
    filterChecks = document.querySelectorAll(".checkitem"),
    clearBtn = document.querySelector("#bsg-clearfilters"),
    filterCombo = document.querySelector("#bsg-filtercombo")
  let allFilters

  function closeFilterSet() {
    const activeSet = document.querySelector("[data-bsg-filterset].active")
    if (activeSet) {
      activeSet.classList.remove("active")
    }
    filterSets.forEach((set) => {
      set.hidden = true
      set.classList.remove("flex")
    })

    toggleRows()
  }

  function clearAllFilters() {
    filterChecks.forEach((filterCheck) => {
      filterCheck.checked = false
    })
    rows.forEach((row) => {
      row.hidden = false
    })
    filterInput.disabled = false
    filterInput.value = ""

    checkNoMatches("bsg", table, rows)
    allFilters = {}
    filterCombo.innerHTML = ""
    clearBtn.classList.add("dn")
  }

  clearBtn.addEventListener("click", function () {
    closeFilterSet()
    clearAllFilters()
  })

  // Input filter
  filterInput.addEventListener("keyup", function () {
    const query = this.value.toLowerCase()
    const notEmpty = query.length >= 1
    if (notEmpty) {
      clearBtn.classList.remove("dn")
    } else {
      clearBtn.classList.add("dn")
    }

    rows.forEach((row) => {
      if (
        row
          .querySelector('[data-filter="name"]')
          ?.textContent?.toLowerCase()
          ?.includes(query) ||
        row
          .querySelector('[data-filter="servcode"]')
          ?.textContent?.toLowerCase()
          ?.includes(query) ||
        row
          .querySelector('[data-filter="reqcode"]')
          ?.textContent?.toLowerCase()
          ?.includes(query)
      ) {
        row.hidden = false
      } else {
        row.hidden = true
      }
    })

    checkNoMatches("bsg", table, rows)
  })

  function makeComboOverview(allFilters) {
    filterCombo.innerHTML = ""

    function appliedBtn(active, title) {
      return (
        '<button type="button" data-bsg-title="' +
        active +
        '" class="btn-link btn-link--filter"><span data-mybicon="mybicon-cross" data-mybicon-class="mrxs pointev-none"></span>' +
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
            '" class="btn-link btn-link--filter mrxs"><span data-mybicon="mybicon-cross" data-mybicon-class="mrxs pointev-none"></span>' +
            filter +
            "</button>"
        })
        appliedFilter = appliedFilter + "</div>"
        filterCombo.insertAdjacentHTML("beforeend", appliedFilter)
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
  filterCombo.addEventListener("click", function (e) {
    const clicked = e.target
    if (clicked.dataset.bsgTitle && !clicked.dataset.bsgType) {
      // Sets
      let subButtons = document.querySelectorAll(
        'button[data-bsg-type="' + clicked.dataset.bsgTitle + '"]'
      )
      subButtons.forEach((subButton) => {
        toggleCheckbox(subButton)
      })
    }

    // Single subfilters
    if (clicked.dataset.bsgType && clicked.dataset.bsgTitle) {
      toggleCheckbox(clicked)
    }
  })

  // Create object for storing active filters
  allFilters = {}
  filterSets.forEach((set) => {
    allFilters[set.id] = []
  })

  function toggleRows() {
    let activeFilterSets = 0
    for (let activeFilter in allFilters) {
      if (allFilters[activeFilter].length > 0) {
        activeFilterSets++
        filterInput.disabled = true
        filterInput.value = ""
      }
    }

    // Clear all filtering if sets are closed and none are active
    let fsActive = false
    filterSetBtns.forEach((btn) => {
      if (btn.classList.contains("active")) {
        fsActive = true
        return
      }
    })
    if (!fsActive && activeFilterSets <= 0) {
      clearAllFilters()
      return
    }

    // Toggle table rows
    if (activeFilterSets <= 0) {
      rows.forEach((row) => {
        row.hidden = false
      })
    } else {
      rows.forEach((row) => {
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

  // Set filters
  filterSetBtns.forEach((filterBtn) => {
    filterBtn.addEventListener("click", function () {
      const currentFilterSet = this.dataset.bsgFilterset
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

          makeComboOverview(allFilters)
          toggleRows()
          checkNoMatches("bsg", table, rows)
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
}
