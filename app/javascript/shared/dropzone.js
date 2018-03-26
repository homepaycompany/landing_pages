import Dropzone from 'dropzone';
import 'dropzone/dist/dropzone.css';

function launchDropzone() {
  // disableNextSection();
  if (document.getElementById('js-dropzone-uploaded')) {
    enableNextSection();
  }
  newDropzone();
}

function newDropzone() {
  Dropzone.autoDiscover = false;
  const myDropzone = new Dropzone("#doc-dropzone", {
    dictDefaultMessage: "",
    clickable: "#clickable",
    previewTemplate: document.querySelector('#tpl').innerHTML
    });

  // code found on internet to prevent issues with SAFARI and IE browsers
  myDropzone.handleFiles = function(files) {
    var _this5 = this;
    var files_array = [];

    for (var i = 0; i < files.length; i++) {
      files_array.push(files[i]);
    }

    return files_array.map(function(file) {
      return _this5.addFile(file);
    });
  };

  myDropzone.on("success", function(file, response) {
  enableNextSection();
  });
}

function disableNextSection () {
  const b = document.getElementById('js-validate-section');
  b.classList.add('js-block-next-section');
  b.classList.add('disabled');
}

function enableNextSection () {
  const b = document.getElementById('js-validate-section');
  b.innerHTML = "Continuer"
  // b.classList.remove('js-block-next-section');
  // b.classList.remove('disabled');

}

export { launchDropzone }
