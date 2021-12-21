const riRows = document.querySelectorAll("#services-ri tbody tr")
const rifilterInput = document.querySelector("#servicefilter-ri")
const riFilterBtns = document.querySelectorAll("[data-filterbtnri]")
const riFilterSets = document.querySelectorAll("#filtersets-ri fieldset")
const riFilterChecks = document.querySelectorAll("[data-check]")
const clearBtnRi = document.querySelector("#clearfilters-ri")
const apiBadges = document.querySelectorAll("[data-badge]")
const cutoffRi = document.querySelector("#cutoff-ri")
const cutoffRiBtn = cutoffRi.querySelector("button")

cutoffRiBtn.addEventListener("click", function () {
  cutoffRi.hidden = true
  riRows.forEach((row) => {
    row.hidden = false
  })
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

// Input filter
rifilterInput.addEventListener("keyup", function (e) {
  hideCutoffsRi()
  const query = event.target.value.toLowerCase()
  const len = query.length >= 1
  const jsInserts = document.querySelectorAll("[data-jsins]")

  jsInserts.forEach((insert) => {
    insert.remove()
  })

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
            row.dataset.api +
            "</span></td>"
        )
        row.insertAdjacentHTML(
          "afterbegin",
          "<td data-jsins>" + row.dataset.cntype + "</td>"
        )
        row.insertAdjacentHTML(
          "afterbegin",
          '<th data-jsins scope="row">' + row.dataset.family + "</th>"
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

document.addEventListener("DOMContentLoaded", function () {
  tableCutoffRi()
})
