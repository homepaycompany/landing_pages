function formSectionValidation() {
  const c = document.getElementById('js-validate-section');
  c.addEventListener('click', (e) => {
    if (!c.classList.contains('js-block-next-section') && validateFields()) {
      document.querySelectorAll('.form-field-submit-button').forEach((b) => {
        if (!b.classList.contains('js-no-validate')) {
          b.click()
        }
      })
      setTimeout(function(){document.getElementById('move-to-next-section').click();}, 1000)
    }
  })
}

function validateFields() {
  document.querySelectorAll('.form-wrong-input-format').forEach((f) => {
    f.remove()
  })
  let i = true
  document.querySelectorAll('.form-control').forEach((f) => {
    if (f.type === 'number' && parseInt(f.value, 10)) {
      i = i && true
    } else if (f.type === 'text' && typeof f.value === 'string' && f.value !== '') {
      i = i && true
      f.value = f.value.toLowerCase()
    } else if (f.type === 'email' && f.value.match(/^[^@\s]+@[^@\s]+$/)) {
      i = i && true
      f.value = f.value.toLowerCase()
    } else if (f.type === 'tel' && f.value.match(/(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/)) {
      i = i && true
      f.value = f.value.toLowerCase()
    } else if (f.classList.contains('js-no-validate')) {
      i = i && true
    } else {
      f.parentElement.parentElement.parentElement.parentElement.insertAdjacentHTML('beforeEnd', `<div class='form-wrong-input-format'>Format incorrect<div>`)
      i = i && false
    }
  })
  return i
}

export { formSectionValidation }
