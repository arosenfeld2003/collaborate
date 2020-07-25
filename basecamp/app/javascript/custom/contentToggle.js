document.addEventListener('turbolinks:load', function() {
  let contentToogleBtn = document.querySelectorAll(".content-toggle-btn");

  for (let i = 0; i < contentToogleBtn.length; i++) {
    contentToogleBtn[i].addEventListener("click", (e) => {

      if(e.target.classList.contains("show")) {
        e.target.classList.remove("show");
      } else {
        for (let j = 0; j < contentToogleBtn.length; j++) {
          if (contentToogleBtn[j].classList.contains("show")) {
            contentToogleBtn[j].classList.remove("show");
          }
        }
        e.target.classList.add("show");
      }
    });
  }
}, false);
