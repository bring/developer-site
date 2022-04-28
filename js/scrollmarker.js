//Show in left menu which endpoint is in viewport
const anchoredTitles = document.querySelectorAll('.dev-anchored')

if(anchoredTitles.length > 0) {
  const listItems = document.querySelectorAll('[data-list-item]')

  let observerOptions = {
    root:document.body.main,
    rootMargin: '-45% -45%',
    threshold: 0
  }
  
  const ob = new IntersectionObserver(observeFunc,observerOptions)

  anchoredTitles.forEach((el) => {
    ob.observe(el)
  })

  function observeFunc(entries) {
    entries.forEach(entry => {
      if(entry.isIntersecting) {
        let listItem = document.querySelector('[data-list-item="'+entry.target.id+'"]')
        if(listItem) {
          listItems.forEach(item => {
            item.classList.remove("active")
          })
          listItem.scrollIntoView({ behavior: "smooth", block: "center", inline: "nearest" })
          listItem.classList.add('active')
        }
      }
    })
  }

  listItems.forEach(li => {
    li.addEventListener('click', function() {
      setTimeout(function() {
        listItems.forEach(item => {
          item.classList.remove("active")
        })
        li.classList.add('active')
      }, 10)
    })
  })
}
