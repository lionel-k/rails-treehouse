function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var treehouseLocation = document.getElementById('treehouse_location');

    if (treehouseLocation) {
      var autocomplete = new google.maps.places.Autocomplete(treehouseLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(treehouseLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
