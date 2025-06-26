import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class GoogleMapComponent extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  final double zoom;
  final Set<Marker>? markers;
  final Function(GoogleMapController)? onMapCreated;
  final Function(LatLng)? onTap;
  final double height;
  final bool showExpandButton;
  final Function()? onExpand;

  const GoogleMapComponent({
    Key? key,
    this.latitude,
    this.longitude,
    this.zoom = 14.0,
    this.markers,
    this.onMapCreated,
    this.onTap,
    this.height = 200.0,
    this.showExpandButton = true,
    this.onExpand,
  }) : super(key: key);

  @override
  State<GoogleMapComponent> createState() => _GoogleMapComponentState();
}

class _GoogleMapComponentState extends State<GoogleMapComponent> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> _markers = <Marker>{};
  late LatLng _currentLocation;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() {
    // Set initial location
    _currentLocation = LatLng(
      widget.latitude ?? 37.7749,
      widget.longitude ?? -122.4194,
    );

    // Set initial markers
    _markers = widget.markers ?? <Marker>{};
  }

  void _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
    widget.onMapCreated?.call(controller);
  }

  void _onMapTapped(LatLng position) {
    widget.onTap?.call(position);
  }

  // Method to add a marker programmatically
  void addMarker(String markerId, LatLng position, {String? infoWindow}) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(markerId),
          position: position,
          infoWindow: InfoWindow(
            title: infoWindow ?? 'Marker',
            snippet:
                'Lat: ${position.latitude.toStringAsFixed(4)}, Lng: ${position.longitude.toStringAsFixed(4)}',
          ),
        ),
      );
    });
  }

  // Method to remove a marker
  void removeMarker(String markerId) {
    setState(() {
      _markers.removeWhere((marker) => marker.markerId.value == markerId);
    });
  }

  // Method to move camera to a specific location
  Future<void> moveCamera(LatLng position, {double? zoom}) async {
    try {
      final GoogleMapController controller = await _controller.future;
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: zoom ?? widget.zoom),
        ),
      );
    } catch (e) {
      print('Error moving camera: $e');
    }
  }

  // Method to show full screen map
  void _showFullScreenMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => FullScreenMapView(
              latitude: _currentLocation.latitude,
              longitude: _currentLocation.longitude,
              zoom: widget.zoom,
              markers: _markers,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              onTap: _onMapTapped,
              initialCameraPosition: CameraPosition(
                target: _currentLocation,
                zoom: widget.zoom,
              ),
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: true,
              mapToolbarEnabled: false,
              buildingsEnabled: false,
              mapType: MapType.normal,
            ),
          ),
          // Expand button overlay
          if (widget.showExpandButton)
            Positioned(
              top: 8,
              right: 8,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    if (widget.onExpand != null) {
                      widget.onExpand!();
                    } else {
                      _showFullScreenMap(context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.fullscreen,
                      size: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
          // Location button
          Positioned(
            bottom: 8,
            right: 8,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              elevation: 2,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  try {
                    final GoogleMapController controller =
                        await _controller.future;
                    await controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: _currentLocation,
                          zoom: widget.zoom,
                        ),
                      ),
                    );
                  } catch (e) {
                    print('Error centering location: $e');
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.my_location,
                    size: 20,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Full screen map view
class FullScreenMapView extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double zoom;
  final Set<Marker> markers;

  const FullScreenMapView({
    super.key,
    required this.latitude,
    required this.longitude,
    this.zoom = 14.0,
    this.markers = const {},
  });

  @override
  State<FullScreenMapView> createState() => _FullScreenMapViewState();
}

class _FullScreenMapViewState extends State<FullScreenMapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              if (!_controller.isCompleted) {
                _controller.complete(controller);
              }
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.latitude, widget.longitude),
              zoom: widget.zoom,
            ),
            markers: widget.markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            compassEnabled: true,
            mapToolbarEnabled: true,
            buildingsEnabled: false,
            mapType: MapType.normal,
          ),
          // Close button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Icon(Icons.close, size: 24, color: Colors.grey[700]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}