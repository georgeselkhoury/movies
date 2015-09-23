$(function () {

    $('#map').css('height', ($(window).height() - 46) + 'px').css('opacity', 0);
    $('.search-container').hide();

    var mapCanvas = document.getElementById('map');

    var mapOptions = {
        center: new google.maps.LatLng(37.7833, -122.4167),
        zoom: 12,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(mapCanvas, mapOptions);
    var locations = [];

    var locations_hash = {}
    var locations_markers = {};

    load_locations(map);

    function load_locations(map) {
        $.ajax({
            url: 'locations?latitude=37.7833&longitude=-122.4167',
            data: {},
            success: function (result) {
                locations = result;
                locations_markers = create_location_markers(locations);

                $('#loading').hide();
                $('#map').css('opacity', 1);
                $('.search-container').show();

            },
            dataType: 'json'
        });
    }

    function create_location_markers(locations) {
        for (var i = 0; i < locations.length; i++) {
            var location = locations[i];

            locations_hash[location.id] = location

            if (location.latitude && location.longitude) {
                var marker = new google.maps.Marker({
                    position: {lat: location.latitude, lng: location.longitude},
                    map: map,
                    title: location.address
                });

                attachMessage(marker, location);

                locations_markers[location.id] = marker;
            }

        }

        return locations_markers;
    }

    function attachMessage(marker, location) {
        var infowindow = new google.maps.InfoWindow({
            content: build_marker_content(location)

        });

        marker.addListener('click', function () {
            infowindow.open(marker.get('map'), marker);
        });
    }

    function build_marker_content(location) {
        content = 'Location id: ' + location.id + '<br>'
        content +=  'Address: ' + location.address + '<br>'

        if (location.fun_facts) {
            content +=  'Fun Facts: ' + location.fun_facts  + '<br>'
        }

        content +=  '<br>'
        content +=  'Movies:' + '<br>'
        content +=  '-------------' + '<br>'

        for (var i = 0; i < location.movies.length; i++) {
            content +=  'Title: ' + location.movies[i].title + '<br>'
            content +=  'Release Year: ' + location.movies[i].release_year + '<br>'
            content +=  '<br>'
        }

        return content;
    }

    $('#search').keyup(function () {
        var val = $('#search').val();

        if (val.length == 0) {
            $.each(locations_markers, function (locationId, marker) {
                marker.setMap(map);
            });

            return;
        }

        $.each(locations_markers, function (locationId, marker) {
            var marker = locations_markers[locationId];

            var location = locations_hash[locationId];

            var is_val_a_subquery_of_movie = false

            for (var i = 0; i < location.movies.length; i++) {
                var movie = location.movies[i];

                if (movie.title.indexOf(val) > -1) {
                    is_val_a_subquery_of_movie = true;
                    break;

                } else {
                    is_val_a_subquery_of_movie = false;
                }
            }

            is_val_a_subquery_of_movie ? marker.setMap(map) : marker.setMap(null);
        });
    });


});
