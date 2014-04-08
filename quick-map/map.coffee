map_canvas = $ '#map_canvas'

path = []

for [lat, lon] in window.data
    console.log lat, lon
    path.push new google.maps.LatLng lat, lon

console.log path

map = new google.maps.Map map_canvas[0],
    zoom: 9
    center: new google.maps.LatLng 52, 0
    mapTypeId: google.maps.MapTypeId.ROADMAP

new google.maps.Polyline
    path: path
    map: map
    strokeColor: "#0000ff"
    strokeOpacity: 0.8
