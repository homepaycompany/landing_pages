function addBooleanToForm () {
  selectState()
  document.querySelectorAll('#js-form-toggle-btn').forEach((b) => {
    b.addEventListener('click', (e) => {
      addOneChoiceToForm(b);
    })
  })
}

function addOneChoiceToForm (b) {
  b.classList.toggle('active');
  const f = document.getElementById(`property_form_${b.dataset.name}`);
  f.value = Math.abs(f.value - 1);
}

function selectState () {
  document.querySelectorAll('#js-form-toggle-btn').forEach((b) => {
    if (b.dataset.selected === "true") {
      addOneChoiceToForm(b);
    }
  })
}

export { addBooleanToForm }
