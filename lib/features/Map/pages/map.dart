import 'dart:ffi';

import 'package:bsc_app/features/Map/logic/models/position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

position p = position();

class MapPage extends StatelessWidget {
  Future<position> _determinePosition() async {
    await p.determinePosition();
    return p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<position>(
        future: _determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            double lat = snapshot.data?.latitude ?? 36.75732;
            print(snapshot.data?.latitude);
            double long = snapshot.data?.longitude ?? 3;
            return FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(lat, long), // San Francisco coordinates
                initialZoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.myapp',
                ),
                MarkerLayer(markers: [
                  Marker(
                    point: LatLng(lat, long),
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.red,
                      onPressed: () async {
                        await p.determinePosition();
                      },
                    ),
                  ),
                ]),
              ],
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
