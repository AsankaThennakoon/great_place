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
  LatLng? _picksedLocation;
  void _selectLocation(LatLng position) {
    setState(() {
      _picksedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
                onPressed: _picksedLocation == null
                    ? null
                    : () {
                        Navigator.of(context).pop(_picksedLocation);
                      },
                icon: Icon(Icons.check))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLoaction.latitude,
              widget.initialLoaction.longitude),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: _picksedLocation == null
            ? {
                Marker(
                  markerId: MarkerId('I'),
                  position: const LatLng(7.0817935, 80.4700367),
                ),
              }
            : {
                Marker(
                  markerId: MarkerId('m1'),
                  position: _picksedLocation as LatLng,
                ),
              },
      ),
    );
  }
}
