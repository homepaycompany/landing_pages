function goBack() {
  document.getElementById('js-go-back').addEventListener('click', (e) => {
    window.history.back();
  })
}

export { goBack }
