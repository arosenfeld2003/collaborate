document.addEventListener('turbolinks:load', function() {
  var dropdownBtn = document.querySelector(".dropdown-toggle");
  var dropdownMenu = document.querySelector(".dropdown-menu");

  dropdownBtn.addEventListener("click", (e) => {
    dropdownMenu.classList.toggle("show");
  });

  window.onclick = function(event) {
  if (!event.target.matches('.dropdown-toggle')) {
    if (dropdownMenu.classList.contains('show')) {
      dropdownMenu.classList.remove('show');
    }
  }
}
}, false);
