import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class position {
  double? latitude;
  double? longitude;
  String location = 'Unknown';
  String cityName = 'Unknown';
  bool cityLoaded = false;
  bool locationLoaded = false;

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, return an error.

      location = 'Location services are disabled.';

      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, return an error.

        location = 'Location permissions are denied';

        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, return an error.

      location = 'Location permissions are permanently denied';

      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    location =
        'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    latitude = position.latitude;
    longitude = position.longitude;
    locationLoaded = true;
  }

  Future<void> getCityName() async {
    try {
      // Get the current position

      if (latitude == null || longitude == null) {
        cityName = "Unknown cridentials";
        return;
      }
      // Reverse geocode to get city name
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude!, longitude!);

      // Extract the city name

      cityName = placemarks.first.locality ?? "Unknown city";
      if (cityName != "Unknown city") {
        cityLoaded = true;
      }
    } catch (e) {
      cityName = "Error: ${e.toString()}";
    }
  }
}
