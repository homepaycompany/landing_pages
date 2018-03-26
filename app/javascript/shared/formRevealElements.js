function setChoiceForm () {
  selectElements ()
  addChoicesToForm ()
}

function selectElements () {
  document.querySelectorAll('.js-form-selection-box').forEach((b) => {
    if (b.dataset.selected === "true") {
      addOneChoiceToForm(b)
    }
  })
}

function addChoicesToForm () {
  document.querySelectorAll('.js-form-selection-box').forEach((b) => {
    b.addEventListener('click', (e) => {
      addOneChoiceToForm(b);
    })
  })
}

function addOneChoiceToForm (b) {
  b.classList.toggle('active');
  formRevealElements(b);
  const f = document.getElementById(`property_form_${b.dataset.name}`);
  f.value = Math.abs(f.value - 1);
}

function formRevealElements (b) {
  if (b.dataset.reveal) {
    const s = document.getElementById(b.dataset.reveal)
    s.classList.toggle('hidden');
    if (s.querySelector('.form-control')) {
      s.querySelector('.form-control').classList.toggle('hidden');
      s.querySelector('.form-control').classList.toggle('js-no-validate');
      s.querySelector('.form-field-submit-button').classList.toggle('js-no-validate');
    }
  }
}

export { setChoiceForm }
