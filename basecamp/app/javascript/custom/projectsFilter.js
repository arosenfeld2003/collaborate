document.addEventListener('turbolinks:load', function() {
  var projectsBtns = document.querySelectorAll('.projects-filter-btn');
  var ownedProjects = Array.from(document.getElementsByClassName('owner'));
  var memberProjects = Array.from(document.getElementsByClassName('member'));

  projectsBtns.forEach((btn) => {
    addEventListener('click', event => {
      let target = event.target;
      if (target.id === 'owner') {
        ownedProjects.forEach(el => el.style.display = "block");
        memberProjects.forEach(el => el.style.display = "none");
      } else if (target.id === 'member') {
        ownedProjects.forEach(el => el.style.display = "none");
        memberProjects.forEach(el => el.style.display = "block");
      } else {
        ownedProjects.forEach(el => el.style.display = "block");
        memberProjects.forEach(el => el.style.display = "block");
      }
    })
  })
}, false);

document.addEventListener('turbolinks:load', function() {
  var fileInput = document.querySelector('.custom-file-input');
  var fileLabel = document.querySelector('.custom-file-label');

  fileInput.addEventListener("change", (e) => {
    if (e.path[0].files.length == 1)
      fileLabel.textContent = e.target.value.replace(/^.*[\\\/]/, '');
    else {
      fileLabel.textContent = e.path[0].files.length + " files"
    }
      console.log(e.path[0].files);
   });
}, false);
