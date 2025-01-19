import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMapWidget extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  final String? title;
  final List<Map<String, dynamic>>? markers;

  const CustomMapWidget({
    super.key,
    this.latitude,
    this.longitude,
    this.title,
    this.markers,
  }) : assert(
          (latitude != null && longitude != null) || markers != null,
          'Either provide latitude and longitude or markers',
        );

  @override
  State<CustomMapWidget> createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
  }

  void _initializeMarkers() {
    if (widget.markers != null) {
      for (var marker in widget.markers!) {
        _markers.add(
          Marker(
            markerId: MarkerId(marker['title'] ?? ''),
            position: LatLng(
              marker['latitude'] as double,
              marker['longitude'] as double,
            ),
            infoWindow: InfoWindow(title: marker['title'] ?? ''),
          ),
        );
      }
    } else if (widget.latitude != null &&
        widget.longitude != null &&
        widget.title != null) {
      _markers.add(
        Marker(
          markerId: MarkerId(widget.title!),
          position: LatLng(widget.latitude!, widget.longitude!),
          infoWindow: InfoWindow(title: widget.title!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.markers != null
            ? LatLng(
                widget.markers!.first['latitude'] as double,
                widget.markers!.first['longitude'] as double,
              )
            : LatLng(widget.latitude!, widget.longitude!),
        zoom: 15,
      ),
      markers: _markers,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}