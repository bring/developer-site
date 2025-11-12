document.querySelectorAll(".read-more").forEach(link => {
  link.addEventListener("click", () => {
    const postContent = link.closest(".update-content");
    if (postContent) {
      postContent.classList.toggle("expanded");
      postContent.querySelector(".truncated-content").classList.toggle('dn');
      postContent.querySelector(".full-content").classList.toggle('screen-reader-text');
      link.textContent = postContent.classList.contains("expanded") ? "Show less" : "Show more";
    }
  })
})
