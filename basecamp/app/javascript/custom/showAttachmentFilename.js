document.addEventListener('turbolinks:load', function() {
  var fileInput = document.querySelector(".custom-file-input");
  var fileLabel = document.querySelector(".custom-file-label");

  fileInput.addEventListener("change", (e) => {
    // use path for Firefox, originalTarget for all other browsers.
    let targetFile = e.target.files || e.path[0].files;
    if (targetFile) {
      fileLabel.textContent = targetFile[0].name;
    } else {
      fileLabel.textContent = "No file chosen"
    }
  });
}, false);