const tabArray = document.querySelectorAll('button[data-toggle]')

for (let tab of tabArray) {
  tab.addEventListener('click', () => {
    const panelId = tab.getAttribute('aria-controls')
    const panel = document.querySelector('#' + panelId)

    const tabGroupArr = document.querySelectorAll('button[data-toggle="' + panel.dataset.tabGroup + '"]')
    for (let tab of tabGroupArr) {
      tab.classList.remove('mb-card--active')
      tab.setAttribute('aria-expanded', 'false')
    }

    const tabPanelArr = document.querySelectorAll('div[data-tab-group="' + panel.dataset.tabGroup + '"]')
    for (let tabPanel of tabPanelArr) {
      tabPanel.classList.add('dn')
    }

    panel.classList.remove('dn')
    tab.classList.add('mb-card--active')
    tab.setAttribute('aria-expanded', 'true')
  })
}
