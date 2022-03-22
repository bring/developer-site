import {
  cutoffRows,
  hideCutoffs,
  checkNoMatches,
  toggleSets,
} from "./servicefiltering-common"

const container = document.querySelector("#all-vas"),
  items = container.querySelectorAll(".vas-item"),
  serviceCountryRows = document.querySelectorAll(".vascountry tbody tr"),
  filterInput = document.querySelector("#vasfilter"),
  filterSetBtns = document.querySelectorAll("[data-vas-filterset]"),
  filterSets = document.querySelectorAll("#filtersets fieldset"),
  filterChecks = document.querySelectorAll("[data-check]"),
  clearBtn = document.querySelector("#clearfilters"),
  cutoff = document.querySelector("#vas-cutoff"),
  showAll = document.querySelector("#showAll")

function clearAllFilters() {
  hideCutoffs(cutoff)
  const activeBtn = document.querySelector("[data-vas-filterset].active")
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
  items.forEach((item) => {
    item.hidden = false
    item.hidden = false
  })
  serviceCountryRows.forEach((row) => {
    row.hidden = false
  })
  filterInput.value = ""

  checkNoMatches("vas", container, items)
  clearBtn.classList.add("dn")
}

clearBtn.addEventListener("click", function () {
  clearAllFilters()
})

showAll.addEventListener("click", () => {
  clearAllFilters()
})

// Input filter
filterInput.addEventListener("keyup", function (e) {
  hideCutoffs(cutoff)
  const query = e.target.value.toLowerCase()
  const notEmpty = query.length >= 1
  if (notEmpty) {
    clearBtn.classList.remove("dn")
  } else {
    clearBtn.classList.add("dn")
  }

  items.forEach((item) => {
    if (
      item
        .querySelector('[data-filter="name"]')
        ?.textContent?.toLowerCase()
        ?.includes(query) ||
      item
        .querySelector('[data-filter="sgcode"]')
        ?.textContent?.toLowerCase()
        ?.includes(query) ||
      item
        .querySelector('[data-filter="bookcode"]')
        ?.textContent?.toLowerCase()
        ?.includes(query)
    ) {
      item.hidden = false
    } else {
      item.hidden = true
    }
  })

  checkNoMatches("vas", container, items)
})

// Set filters
filterSetBtns.forEach((filterBtn) => {
  filterBtn.addEventListener("click", function (e) {
    const currentFilterSet = e.target.dataset.vasFilterset
    if (e.target.classList.contains("active")) {
      clearAllFilters()
      return
    }

    clearAllFilters()
    e.target.classList.add("active")
    clearBtn.classList.remove("dn")

    toggleSets(filterSets, currentFilterSet)

    const setChecks = document.querySelectorAll(
      'input[data-filter="' + currentFilterSet + '"]'
    )

    setChecks.forEach((setCheck) => {
      setCheck.addEventListener("click", function (e) {
        const filterType = e.target.dataset.filter
        const dataFilter = '[data-filter="' + filterType + '"]'

        let showAll = true
        let showChecked = []
        setChecks.forEach((setCheck, i) => {
          if (setCheck.checked === true) {
            showAll = false
            showChecked[i] = setCheck.value.toLowerCase()
          }
        })

        if (showAll) {
          items.forEach((item) => {
            item.hidden = false
          })
          serviceCountryRows.forEach((row) => {
            row.hidden = false
          })
        } else {
          items.forEach((item) => {
            let affectedRows = 0
            showChecked.forEach((show) => {
              if (
                [
                  ...item.querySelectorAll(
                    ".vascountry tbody tr " + dataFilter
                  ),
                ]?.some((r) => r.textContent?.toLowerCase() === show)
              ) {
                affectedRows++
              }
            })
            if (affectedRows == 0) {
              item.hidden = true
            } else {
              item.hidden = false
            }
          })
          serviceCountryRows.forEach((row) => {
            row.hidden = true
            showChecked.forEach((currentFilter) => {
              if (row.querySelector(dataFilter)) {
                const currentRowData = row
                  .querySelector(dataFilter)
                  .textContent.toLowerCase()
                if (currentRowData === currentFilter) {
                  row.hidden = false
                }
              }
            })
          })
        }
        checkNoMatches("vas", container, items)
      })
    })
  })
})

function scrollToTarget(targetElement) {
  const element = document.getElementById(targetElement),
    headerOffset =
      document.querySelector("[data-siteheader]").offsetHeight + 20,
    elementPosition = element.getBoundingClientRect().top,
    offsetPosition = elementPosition + window.pageYOffset - headerOffset,
    vasBtnParent = element.parentElement,
    vasBtnToggler = vasBtnParent.querySelector("[data-collapse]"),
    vasItemContent = vasBtnParent.querySelector("[data-vas-element]")

  if (vasBtnToggler) {
    vasBtnToggler.classList.remove("dev-collapsible__toggler--collapsed")
    vasBtnToggler.classList.add("dev-collapsible__toggler--expanded")
  }

  if (vasItemContent) {
    vasItemContent.classList.remove("dev-collapsible__item--collapsed")
    vasItemContent.classList.add("dev-collapsible__item--expanded")
  }

  window.scrollTo({
    top: offsetPosition,
    behavior: "smooth",
  })
}

document.addEventListener("DOMContentLoaded", function () {
  const anchorTag = window.location.hash

  if (anchorTag) {
    const cleanAnchorTag = anchorTag.replace(/#/, "")

    hideCutoffs(cutoff)
    //Delay added for Chrome so window.scrollTo event will be triggered
    setTimeout(function () {
      scrollToTarget(cleanAnchorTag)
    }, 100)
  } else {
    cutoffRows(items, 10)
  }

  const anchors = document.querySelectorAll(".anchorjs-link")
  anchors.forEach((anchor) => {
    anchor.addEventListener("click", function () {
      const anchorId = this.getAttribute("href")
      const anchorParent = document
        .getElementById(anchorId.replace(/#/, ""))
        .getAttribute("id")
      setTimeout(function () {
        scrollToTarget(anchorParent)
      }, 100)
    })
  })
})
