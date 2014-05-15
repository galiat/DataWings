$(function() {
  var mapOptions = {
    center: new google.maps.LatLng(42.3519, -71.0582),
    zoom: 8,
    scaleControl: true,
    zoomControl: true,
    panControl: true
  };

  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  var bounds = new google.maps.LatLngBounds ();

  $.getJSON(window.location.pathname + '/fireflies.json', function(data) {
    console.log(data);

    var fireflies = $.map(data, function(firefly) {
      var loc = new google.maps.LatLng(firefly.location[0], firefly.location[1]);
      bounds.extend(loc);

      var marker = new google.maps.Marker({
        position: loc,
        map: map,
        title: firefly.name
      });

      var infowindowContent = '<b>' + firefly.name + '</b>' +
      '<div><dl>' +
      '<dt>Newborns Treated</dt><dd>' + firefly.newborns_treated + '</dd>' +
      '<dt>Total Hours</dt><dd>' + firefly.total_hours + '</dd>' +
      '</div>';

      var infowindow = new google.maps.InfoWindow({ content: infowindowContent });

      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
      });

      console.log(loc);

      return loc;
    });

    map.fitBounds (bounds);
  });
});