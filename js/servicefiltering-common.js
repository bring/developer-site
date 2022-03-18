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
