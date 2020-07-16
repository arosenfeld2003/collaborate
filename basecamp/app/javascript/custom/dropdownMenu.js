document.addEventListener('turbolinks:load', function() {
  var dropdownBtn = document.querySelector(".dropdown-toggle");
  var dropdownMenu = document.querySelector(".dropdown-menu");

  dropdownBtn.addEventListener("click", (e) => {
    dropdownMenu.classList.toggle("show");
  });
}, false);
