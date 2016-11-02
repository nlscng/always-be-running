//contains JS for the Google Maps integration

function codeAddress(data, map, geocoder, infowindow) {
    // delete markers
    if (typeof map.markers != 'undefined') {
        for (var i = 0; i < map.markers.length; i++) {
            map.markers[i].setMap(null);
            google.maps.event.clearListeners(map.markers[i], 'click');
        }
    }
    map.markers = [];
    var bounds = new google.maps.LatLngBounds();
    // putting down markers
    for (i = 0; i < data.length; i++) {
        if (data[i].location !== 'online' && data[i].location_lat && data[i].location_lng) {
            var latlng = new google.maps.LatLng(data[i].location_lat, data[i].location_lng),
                infotext = renderInfoText(data[i]),
                marker = new google.maps.Marker({
                    map: map,
                    position: latlng
                });
            map.markers.push(marker);
            bounds.extend(marker.getPosition());

            // searching for the same location, merging
            for (var u = 0; u < i; u++) {
                if (data[i].location_lng == data[u].location_lng && data[i].location_lat == data[u].location_lat) {
                    infotext = renderInfoText(data[u]) + '<hr/>' + renderInfoText(data[i]);
                }
            }

            // set listener for infowindow
            marker.addListener('click', (function (infotext, infowindow, map, marker) {
                return function() {
                    infowindow.setContent(infotext);
                    infowindow.open(map, marker);
                }
            })(infotext, infowindow, map, marker));
        }
    }
    // avoiding to much zoom
    var zoombounds = 0.002;
    if (bounds.getNorthEast().equals(bounds.getSouthWest())) {
        var extendPoint1 = new google.maps.LatLng(bounds.getNorthEast().lat() + zoombounds, bounds.getNorthEast().lng() + zoombounds);
        var extendPoint2 = new google.maps.LatLng(bounds.getNorthEast().lat() - zoombounds, bounds.getNorthEast().lng() - zoombounds);
        bounds.extend(extendPoint1);
        bounds.extend(extendPoint2);
    }
    map.fitBounds(bounds);
}

function renderInfoText(data) {
    var html = '<a href="/tournaments/' + data.id + '"><strong>' + data.title + '</strong></a><br/>' +
        '<em>' + data.type + '</em><br/>' +
        '<strong>city</strong>: ' + data.location + '<br/>';
    if (data.store !== '') {
        html = html + '<strong>store</strong>: ' + data.store + '<br/>';
    }
    html = html + '<strong>date</strong>: ' + data.date + '<br/>' +
        '<strong>cardpool</strong>: ' + data.cardpool;
    if (data.contact !== '') {
        html = html + '<br/><strong>contact</strong>: ' + data.contact;
    }
    return html;
}

function renderPlace(place, marker, map) {
    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
        var bounds = new google.maps.LatLngBounds();
        bounds.union(place.geometry.viewport);
        var zoombounds = 0.002;
        if (Math.abs(bounds.getNorthEast().lat() - bounds.getSouthWest().lat()) < zoombounds ) {
            var extendPoint1 = new google.maps.LatLng(bounds.getNorthEast().lat() + zoombounds, bounds.getNorthEast().lng() + zoombounds);
            var extendPoint2 = new google.maps.LatLng(bounds.getNorthEast().lat() - zoombounds, bounds.getNorthEast().lng() - zoombounds);
            bounds.extend(extendPoint1);
            bounds.extend(extendPoint2);
        }
        map.fitBounds(bounds);
        //map.fitBounds(place.geometry.viewport);
    } else {
        map.setCenter(place.geometry.location);
        map.setZoom(15);
    }
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    // if we are on the tournament form, refresh infos
    if (document.getElementById('location_place_id')) {
        refreshAddressInfo(place);
    }
}

function refreshAddressInfo(place) {
    // place id
    if (typeof place.place_id !== 'undefined') {
        document.getElementById('location_place_id').value = place.place_id;
    } else {
        document.getElementById('location_place_id').value = '';
    }
    // place name, address
    if (typeof place.types !== 'undefined') {
        // if the store/place has a name
        if ($.inArray('establishment', place.types) > -1 || ($.inArray('store', place.types) > -1)) {
            document.getElementById('store').innerHTML = place.name;
            document.getElementById('location_store').value = place.name;
        } else {
            document.getElementById('store').innerHTML = '';
            document.getElementById('location_store').value = '';
        }
        // if it has an address
        if ($.inArray('street_address', place.types) > -1 || $.inArray('store', place.types) > -1
            || $.inArray('establishment', place.types) > -1) {
            document.getElementById('address').innerHTML = place.formatted_address;
            document.getElementById('location_address').value = place.formatted_address;
        } else {
            document.getElementById('address').innerHTML = '';
            document.getElementById('location_address').value = '';
        }
    } else {
        document.getElementById('store').innerHTML = '';
        document.getElementById('address').innerHTML = '';
        document.getElementById('location_store').value = '';
        document.getElementById('location_address').value = '';
    }
    // country, city, US state
    if (typeof place.address_components !== 'undefined') {
        document.getElementById('country').innerHTML = '';
        document.getElementById('city').innerHTML = '';
        document.getElementById('location_country').value = '';
        document.getElementById('location_city').value = '';
        place.address_components.forEach(function (comp) {
            if (comp.types[0] === 'country') {
                document.getElementById('country').innerHTML = comp.long_name;
                document.getElementById('location_country').value = comp.long_name;
            }
            if (comp.types[0] === 'locality') {
                document.getElementById('city').innerHTML = comp.long_name;
                document.getElementById('location_city').value = comp.long_name;
            }
            if (comp.types[0] === 'administrative_area_level_1') {
                document.getElementById('state').innerHTML = comp.long_name;
                document.getElementById('location_state').value = comp.short_name;
            }
        });
        if (document.getElementById('country').innerHTML !== 'United States') {
            document.getElementById('state').innerHTML = '';
            document.getElementById('location_state').value = '';
        }
    }
    //coordinates
    document.getElementById('location_lat').value = place.geometry.location.lat();
    document.getElementById('location_long').value = place.geometry.location.lng();
}
