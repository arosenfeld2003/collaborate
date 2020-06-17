(function() {
  window.onload = function() {
    const projectsBtns = document.querySelectorAll('.projects-filter-btn');
    const ownedProjects = Array.from(document.getElementsByClassName('owner'));
    const memberProjects = Array.from(document.getElementsByClassName('member'));

    projectsBtns.forEach(btn => {
      addEventListener('click', event => {
        let target = event.target;
        if (target.id === 'owner') {
          ownedProjects.forEach(el => el.style.display = "block");
          memberProjects.forEach(el => el.style.display = "none");
        } else if (target.id === 'member'){
          ownedProjects.forEach(el => el.style.display = "none");
          memberProjects.forEach(el => el.style.display = "block");
        } else {
          ownedProjects.forEach(el => el.style.display = "block");
          memberProjects.forEach(el => el.style.display = "block");
        }
      })
    })
  }
})()
