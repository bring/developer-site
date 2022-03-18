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
  console.log(noMatch)
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
