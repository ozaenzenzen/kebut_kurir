import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final double lat, long;
  const MapSample({super.key, required this.lat, required this.long});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  late LatLng _currentLocation;

  @override
  void initState() {
    super.initState();
    print('SCREEN MAPS');
    Future.delayed(Duration.zero,()async{
      await _getCurrentLocation();
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _addMarker(_currentLocation);
        _getAddressFromCoordinates(_currentLocation);
      });
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  Set<Marker> _markers = <Marker>{};

  void _addMarker(LatLng latLng) {
    final MarkerId markerId = MarkerId(latLng.toString());
    final Marker newMarker = Marker(
      markerId: markerId,
      position: latLng,
    );

    setState(() {
      _markers.clear();
      _markers.add(newMarker);
    });
  }

  Future<void> _getAddressFromCoordinates(LatLng latLng) async {
    try {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newLatLng(latLng),
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        // String address = '${placemark.name}, ${placemark.locality}, ${placemark.country}';
        // String address = '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}, ${placemark.postalCode}';
        // _showAddressDialog(address);
        // Uint8List? dataScreenshot = await _takeMapScreenshot();

        debugPrint('${placemark.toJson()}');
        // Uint8List? dataScreenshot = await _takeMapScreenshotV2();
        // widget.actionCallback?.call(placemark, address, dataScreenshot);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.long),
        zoom: 14.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: _markers,
    );
  }
}
