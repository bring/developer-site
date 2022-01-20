/*const openDrawerMenu = () => {
  const dataDrawer = document.querySelectorAll('[data-drawer]')
  dataDrawer.forEach(drawerTargets => {
    drawerTargets.classList.toggle('drawn')
  })
}

const drawerEvent = document.querySelectorAll('[data-drawer-event]')
drawerEvent.forEach(drawerEventTargets => {
    drawerEventTargets.addEventListener('click', openDrawerMenu)
})*/

const drawerBtn = document.querySelector('[data-drawer-btn]')

if(drawerBtn) {
  const drawers = document.querySelectorAll('[data-drawer]')
  const drawerEventAreas = document.querySelectorAll('[data-drawer-event]')

  const openDrawerMenu = () => {
    drawers.forEach(drawer => {
      drawer.classList.add('drawn')
    })
  }

  const closeDrawerMenu = () => {
    drawers.forEach(drawer => {
      drawer.classList.remove('drawn')
    })
  }

  drawerBtn.addEventListener('click', openDrawerMenu)

  drawerEventAreas.forEach(drawerEvent => {
    drawerEvent.addEventListener('click', function() {
      closeDrawerMenu()
    })
  })
}
