document.addEventListener('turbolinks:load', function() {
  let dropdownBtn = document.querySelectorAll(".dropdown-toggle");

  for (let i = 0; i < dropdownBtn.length; i++) {
    dropdownBtn[i].addEventListener("click", (e) => {
      let dropdown = e.target.parentNode;
      let dropdownContent = dropdown.querySelector(".dropdown-menu");
      dropdownContent.classList.toggle("show");
    });
  }
}, false);
