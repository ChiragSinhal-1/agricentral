import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResourceLocatorMap extends StatefulWidget {
  const ResourceLocatorMap({Key? key}) : super(key: key);

  @override
  _ResourceLocatorMapState createState() => _ResourceLocatorMapState();
}

class _ResourceLocatorMapState extends State<ResourceLocatorMap> {
  late GoogleMapController _controller;
  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(24.903623, 67.198367));
  final List<Marker> markers = [];

  addMarker(coordinate) {
    int id = Random().nextInt(100);
    setState(() {
      markers
          .add(Marker(position: coordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resource Locator Map"),
          centerTitle: true,
        ),
        body: GoogleMap(
          initialCameraPosition: _initialPosition,
          mapType: MapType.normal,
          onMapCreated: (controller) {
            setState(() {
              _controller = controller;
            });
          },
          markers: markers.toSet(),
          onTap: (coordinate) {
            _controller.animateCamera(CameraUpdate.newLatLng(coordinate));
            addMarker(coordinate);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.animateCamera(CameraUpdate.zoomOut());
          },
          child: Icon(Icons.zoom_out_map_rounded),
        ),
      ),
    );
  }
}
