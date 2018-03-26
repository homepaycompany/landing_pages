function addStateToForm () {
  selectState();
  document.querySelectorAll('#js-form-state-box').forEach((b) => {
    b.addEventListener('click', (e) => {
      toggleActiveState(b);
    })
  })
}

function toggleActiveState (b) {
  if (!b.classList.contains('active')) {
    document.querySelectorAll(`[data-name='${b.dataset.name}']`).forEach((b) => {
      b.classList.remove('active')
    })
    b.classList.add('active')
    addOneChoiceToForm(b)
  }
}

function addOneChoiceToForm (b) {
  const f = document.getElementById(`property_form_${b.dataset.name}`);
  f.value = b.dataset.value
}

function selectState () {
  document.querySelectorAll('#js-form-state-values-box').forEach((d) => {
    let i = false
    d.querySelectorAll('#js-form-state-box').forEach((b) => {
      if (b.dataset.selected === "true") {
        toggleActiveState(b);
        i = true
      }
    })
    if (!i) {
      toggleActiveState(d.firstElementChild);
    }
  })
}

export { addStateToForm }
