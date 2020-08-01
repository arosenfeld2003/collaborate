document.addEventListener('turbolinks:load', function() {
  let contentToggleBtn = document.querySelectorAll(".content-toggle-btn");

  for (let i = 0; i < contentToggleBtn.length; i++) {
    contentToggleBtn[i].addEventListener("click", (e) => {
      e.preventDefault();
      let parent = contentToggleBtn[i].closest(".list-group-item");
      let content = parent.querySelector(".content-toggle");

      content.classList.toggle("show");
    });
  }
}, false);
