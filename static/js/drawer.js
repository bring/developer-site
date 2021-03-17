const openDrawerMenu = () => {
  const dataDrawer = document.querySelectorAll('[data-drawer]')
  Array.prototype.forEach.call(dataDrawer, (drawerTargets) => {
    drawerTargets.classList.toggle('drawn')
  })
}

const drawerEvent = document.querySelectorAll('[data-drawer-event]')
Array.prototype.forEach.call(drawerEvent, (drawerEventTargets) => {
  drawerEventTargets.addEventListener('click', openDrawerMenu)
})
