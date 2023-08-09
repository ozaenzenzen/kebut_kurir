import 'package:fimber/fimber.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationUtils {
  final double? latitude;
  final double? longitude;
  static Function(bool) locationPermissionHandler = (lastDate) {};

  LocationUtils._(this.latitude, this.longitude);

  static Future<LocationUtils> instance({
    double? latitude,
    double? longitude,
  }) async {
    if (latitude != null && longitude != null) {
      return LocationUtils._(longitude, latitude);
    } else {
      final currentPosition = await getCurrentPosition();
      if (currentPosition == null) {
        return LocationUtils._(0.0, 0.0);
      }
      return LocationUtils._(
        currentPosition.latitude,
        currentPosition.longitude,
      );
    }
  }

  static Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationPermissionHandler(false);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationPermissionHandler(false);
        Fimber.e('Error: Permission Denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      locationPermissionHandler(false);
      Fimber.e('Error: Permission Denied Forever');
      return false;
    }
    return true;
  }

  static Future<Position?> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      return null;
    }
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      Fimber.e('Error: $e');
      return null;
    }
  }

  Future<String> getLocationAddress(
      {required double latitude, required double longitude}) async {
    print('ISI DARI INIT LATITUTE ===> $latitude');
    print('ISI DARI INIT LONGITUTE ===> $longitude');

    try {
      final List<Placemark> location = await placemarkFromCoordinates(
        longitude,
        latitude,
      );
      return '${location.first.street} ${location.first.subThoroughfare}, ${location.first.subLocality}, ${location.first.locality}, ${location.first.subAdministrativeArea}, ${location.first.administrativeArea}';
    } catch (e) {
      Fimber.e('Error: $e');
      return '';
    }
  }
}
