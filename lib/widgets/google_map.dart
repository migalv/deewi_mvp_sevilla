// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'package:universal_ui/universal_ui.dart';

const double _sevillaLocationLat = 37.39362750121883;
const double _sevillaLocationLng = -5.983899589426865;

class GoogleMap extends StatefulWidget {
  final double latitude;
  final double longitude;

  const GoogleMap({
    Key key,
    this.latitude = _sevillaLocationLat,
    this.longitude = _sevillaLocationLng,
  }) : super(key: key);

  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  final String htmlId = "flutter_google_map";

  GMap _map;
  Marker _currentMarker;

  @override
  Widget build(BuildContext context) {
    final location = LatLng(widget.latitude, widget.longitude);
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final mapOptions = MapOptions()
        ..zoom = 17
        ..center = location
        ..disableDefaultUI = true
        ..draggable = false;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none'
        ..style.zIndex = "10";

      _map = GMap(elem, mapOptions);

      _currentMarker = Marker(
        MarkerOptions()
          ..position = location
          ..map = _map,
      );

      return elem;
    });

    if (_currentMarker != null) {
      _currentMarker.map = null;
      _map.center = location;
      _currentMarker = Marker(
        MarkerOptions()
          ..position = location
          ..map = _map,
      );
    }

    return HtmlElementView(viewType: htmlId);
  }
}
