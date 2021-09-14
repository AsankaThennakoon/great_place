import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greate_place/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLoaction;
  final bool isSelecting;
  MapScreen({
    this.initialLoaction = const PlaceLocation(
      latitude: 7.0817935,
      longitude: 80.4700367,
    ),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLoaction.latitude,
              widget.initialLoaction.longitude),
          zoom: 16,
        ),
      ),
    );
  }
}
