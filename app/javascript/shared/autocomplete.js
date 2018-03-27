function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var propertyAddress = document.getElementById('real_estate_property_address');

    if (propertyAddress) {
      var autocomplete = new google.maps.places.Autocomplete(propertyAddress, { types: [ 'geocode' ] });

      // Restrict autocomplete to France
      autocomplete.setComponentRestrictions(
          {'country': ['fr']});

      google.maps.event.addDomListener(propertyAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
