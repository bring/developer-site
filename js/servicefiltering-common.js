export function cutoffRows(rows, size) {
  rows.forEach((row, i) => {
    if (i > size) {
      row.hidden = true
    }
  })
}

export function hideCutoffs(cutoff) {
  cutoff.hidden = true
}

export function checkNoMatches(type, parent, children) {
  const noMatch = document.querySelector("#" + type + "-nomatch")
  let insMessage = true
  if (noMatch) {
    noMatch.remove()
    parent.classList.remove("dn")
  }
  children.forEach((child) => {
    if (child.hidden === false) {
      insMessage = false
      return
    }
  })
  if (insMessage) {
    parent.classList.add("dn")
    parent.insertAdjacentHTML(
      "afterend",
      '<div id="' +
        type +
        '-nomatch" class="message--info pam maxw24r">No matches</div>'
    )
  }
}

export function toggleSets(filterSets, currentFilterSet) {
  filterSets.forEach((set) => {
    if (set.id === currentFilterSet) {
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
}
