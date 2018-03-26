function validateAddress () {
  const f = document.getElementById('js-form-address');
  f.querySelectorAll('.form-submit').forEach((b) => {
    b.addEventListener('click', (e) => {
      e.preventDefault();
      document.querySelectorAll('.form-wrong-input-format').forEach((w) => {
        w.remove();
      })
      const i = f.querySelector('#real_estate_property_address').value;
      googleGeocoder(i);
    })
  })
}

function googleGeocoder (address) {
  var geocoder = new google.maps.Geocoder()
  geocoder.geocode(
    { 'address': address,  'componentRestrictions': { country: 'FR' } },
    function(results, status) {
    if (status == 'OK') {
      checkIfAddressIsOk(results[0])
    } else {
      displayError()
    }
  });
}

function checkIfAddressIsOk (results) {
  const f = document.getElementById('js-form-address').querySelector('form');
  if (results) {
    if ((results['types'] == 'street_address' || results['types'] == 'premise' ) && results['formatted_address'].match(/france/i)) {
      f.submit();
    } else {
    displayError();
    }
  } else {
    displayError();
  }
}

function displayError() {
  const f = document.getElementById('js-form-address');
  f.insertAdjacentHTML('beforeEnd',"<div class='form-wrong-input-format'>L'addresse doit être en France et doit contenir un numéro de rue<div>");
}


export { validateAddress }
