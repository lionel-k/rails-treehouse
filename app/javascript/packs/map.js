import GMaps from 'gmaps/gmaps.js';

const styles = [
    {
        "featureType": "landscape.natural",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#e0efef"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "hue": "#1900ff"
            },
            {
                "color": "#c0e8e8"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": 100
            },
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "lightness": 700
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#7dcdcd"
            }
        ]
    }
];

const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });

  const markers = JSON.parse(mapElement.dataset.markers);
  console.log(markers);

  const customMarkers = []
  customMarkers.forEach(function(marker) {

    const myLatLng = new google.maps.LatLng(marker.lat, marker.lng);

    const customMarker = new google.maps.Marker({
      position: myLatLng,
      map: mapElement,
      title: 'Precision Profiles Manufacturing'
    });

    console.log(customMarker)
    customMarkers.push(customMarker)

  });

  map.addMarkers(markers);

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });

  map.setStyle('map_style');

  // var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
  // var marker = new google.maps.Marker({
  //   position: myLatLng,
  //   map: map,
  //   icon: iconBase + 'http://s3.amazonaws.com/supadu-travel-channel/silo/library/shows/treehouse%20guys.jpg'
  // });

}

import { autocomplete } from '../components/autocomplete';
autocomplete();
