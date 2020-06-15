// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.onload = function() {
  const projectsBtns = document.querySelectorAll('.projects-filter-btn');
  const projectsContent = document.querySelectorAll('.table-wrap');

  const toggleProjects = () => {

    for (let i = 0; i < projectsBtns.length; i++) {

      projectsBtns[i].addEventListener('click', event => {
        event.preventDefault();
        let target = event.target;
        let tabContent = document.getElementById(target.getAttribute("href"));
        removeActive(projectsBtns);
        hideContent(projectsContent);
        target.classList.add("active");
        tabContent.classList.remove("hide");
      });
    }
  }

  const removeActive = (array) => {
    for (let i = 0; i < array.length; i++) {
      array[i].classList.remove("active");
    }
  }

  const hideContent = (array) => {
    for (let i = 0; i < array.length; i++) {
      array[i].classList.add("hide");
    }
  }

  toggleProjects();
}
