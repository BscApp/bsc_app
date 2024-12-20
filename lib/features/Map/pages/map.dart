import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<LatLng> routeCoordinates = [];

  @override
  void initState() {
    super.initState();
    fetchRoute();
  }

  // Fetch route from OSRM public server
  Future<void> fetchRoute() async {
    final url = 'http://router.project-osrm.org/route/v1/car/-0.1278,51.5074;-0.0721,51.5155?overview=false';

    // Make a request to OSRM API
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Check if the geometry exists and is not null
      if (data['routes'] != null && data['routes'].isNotEmpty) {
        final geometry = data['routes'][0]['geometry'];

        if (geometry != null) {
          final decodedPolyline = decodePolyline(geometry);

          setState(() {
            routeCoordinates = decodedPolyline;
          });
        } else {
          print('Error: Geometry is null in the response.');
        }
      } else {
        print('Error: No routes found in the response.');
      }
    } else {
      print('Failed to fetch route: ${response.statusCode}');
    }
  }

  // Helper function to decode the polyline
  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int shift = 0;
      int result = 0;
      int byte;
      do {
        byte = encoded.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);
      lat += (result & 0x01) != 0 ? ~(result >> 1) : (result >> 1);

      shift = 0;
      result = 0;
      do {
        byte = encoded.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);
      lng += (result & 0x01) != 0 ? ~(result >> 1) : (result >> 1);

      polyline.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return polyline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OSRM Route Example")),
      body: routeCoordinates.isEmpty
          ? Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                center: LatLng(51.5074, -0.1278), // Center on London
                zoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routeCoordinates,
                      strokeWidth: 4.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
