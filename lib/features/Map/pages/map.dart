import 'dart:ffi';

import 'package:bsc_app/features/Map/logic/models/position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

position p = position();
List<Map<String, dynamic>> locations = [
  {
    "name": "Albatros Beach Hotel",
    "type": "hotel",
    "latitude": 36.7598,
    "longitude": 3.4715,
    "google_maps_link": "https://www.google.com/maps?q=36.7598,3.4715"
  },
  {
    "name": "Hotel Leïla",
    "type": "hotel",
    "latitude": 36.7523,
    "longitude": 3.4702,
    "google_maps_link": "https://www.google.com/maps?q=36.7523,3.4702"
  },
  {
    "name": "Medina Hotel",
    "type": "hotel",
    "latitude": 36.7641,
    "longitude": 3.4779,
    "google_maps_link": "https://www.google.com/maps?q=36.7641,3.4779"
  },
  {
    "name": "Palm Beach Hotel",
    "type": "hotel",
    "latitude": 36.7556,
    "longitude": 3.4792,
    "google_maps_link": "https://www.google.com/maps?q=36.7556,3.4792"
  },
  {
    "name": "Auberge de Zemmouri",
    "type": "auberge",
    "latitude": 36.7932,
    "longitude": 3.5521,
    "google_maps_link": "https://www.google.com/maps?q=36.7932,3.5521"
  },
  {
    "name": "Chez Nour Restaurant",
    "type": "restaurant",
    "latitude": 36.7634,
    "longitude": 3.4745,
    "google_maps_link": "https://www.google.com/maps?q=36.7634,3.4745"
  },
  {
    "name": "La Sirène Restaurant",
    "type": "restaurant",
    "latitude": 36.7612,
    "longitude": 3.4738,
    "google_maps_link": "https://www.google.com/maps?q=36.7612,3.4738"
  },
  {
    "name": "El Bahia Restaurant",
    "type": "restaurant",
    "latitude": 36.7589,
    "longitude": 3.4726,
    "google_maps_link": "https://www.google.com/maps?q=36.7589,3.4726"
  },
  {
    "name": "Restaurant La Terrasse",
    "type": "restaurant",
    "latitude": 36.7567,
    "longitude": 3.4719,
    "google_maps_link": "https://www.google.com/maps?q=36.7567,3.4719"
  },
  {
    "name": "Plage de Boumerdès",
    "type": "beach",
    "latitude": 36.7640,
    "longitude": 3.4780,
    "google_maps_link": "https://www.google.com/maps?q=36.7640,3.4780"
  },
  {
    "name": "Plage Zemmouri",
    "type": "beach",
    "latitude": 36.7920,
    "longitude": 3.5500,
    "google_maps_link": "https://www.google.com/maps?q=36.7920,3.5500"
  },
  {
    "name": "Plage Cap Djenet",
    "type": "beach",
    "latitude": 36.8000,
    "longitude": 3.5600,
    "google_maps_link": "https://www.google.com/maps?q=36.8000,3.5600"
  },
  {
    "name": "Soummam Monument",
    "type": "monument",
    "latitude": 36.7650,
    "longitude": 3.4760,
    "google_maps_link": "https://www.google.com/maps?q=36.7650,3.4760"
  },
  {
    "name": "Keddara Dam",
    "type": "monument",
    "latitude": 36.7000,
    "longitude": 3.4000,
    "google_maps_link": "https://www.google.com/maps?q=36.7000,3.4000"
  },
  {
    "name": "Zemmouri Port",
    "type": "monument",
    "latitude": 36.7940,
    "longitude": 3.5530,
    "google_maps_link": "https://www.google.com/maps?q=36.7940,3.5530"
  },
  {
    "name": "El Karma Beach",
    "type": "beach",
    "latitude": 36.7660,
    "longitude": 3.4800,
    "google_maps_link": "https://www.google.com/maps?q=36.7660,3.4800"
  },
  {
    "name": "Corso Beach",
    "type": "beach",
    "latitude": 36.7700,
    "longitude": 3.4900,
    "google_maps_link": "https://www.google.com/maps?q=36.7700,3.4900"
  },
  {
    "name": "Aïn Tagourait Mosque",
    "type": "mosque",
    "latitude": 36.7485,
    "longitude": 3.4630,
    "google_maps_link": "https://www.google.com/maps?q=36.7485,3.4630"
  },
  {
    "name": "Ibn Badis Mosque",
    "type": "mosque",
    "latitude": 36.7510,
    "longitude": 3.4655,
    "google_maps_link": "https://www.google.com/maps?q=36.7510,3.4655"
  },
  {
    "name": "Cité 11 Décembre Mosque",
    "type": "mosque",
    "latitude": 36.7535,
    "longitude": 3.4680,
    "google_maps_link": "https://www.google.com/maps?q=36.7535,3.4680"
  },
  {
    "name": "Dar El Bahar Restaurant",
    "type": "restaurant",
    "latitude": 36.7621,
    "longitude": 3.4753,
    "google_maps_link": "https://www.google.com/maps?q=36.7621,3.4753"
  },
  {
    "name": "La Réserve Restaurant",
    "type": "restaurant",
    "latitude": 36.7545,
    "longitude": 3.4712,
    "google_maps_link": "https://www.google.com/maps?q=36.7545,3.4712"
  },
  {
    "name": "Tigre Beach Club",
    "type": "beach",
    "latitude": 36.7625,
    "longitude": 3.4650,
    "google_maps_link": "https://www.google.com/maps?q=36.7625,3.4650"
  },
  {
    "name": "Grand Boumerdès Mall",
    "type": "shopping center",
    "latitude": 36.7605,
    "longitude": 3.4605,
    "google_maps_link": "https://www.google.com/maps?q=36.7605,3.4605"
  },
  {
    "name": "The Green Garden Park",
    "type": "park",
    "latitude": 36.7555,
    "longitude": 3.4525,
    "google_maps_link": "https://www.google.com/maps?q=36.7555,3.4525"
  },
  {
    "name": "Boumerdès University",
    "type": "university",
    "latitude": 36.7588,
    "longitude": 3.4670,
    "google_maps_link": "https://www.google.com/maps?q=36.7588,3.4670"
  },
  {
    "name": "Espace AquaFun",
    "type": "amusement park",
    "latitude": 36.7655,
    "longitude": 3.4800,
    "google_maps_link": "https://www.google.com/maps?q=36.7655,3.4800"
  },
  {
    "name": "El Manar Hotel",
    "type": "hotel",
    "latitude": 36.7742,
    "longitude": 3.5005,
    "google_maps_link": "https://www.google.com/maps?q=36.7742,3.5005"
  },
  {
    "name": "Plage Bleu",
    "type": "beach",
    "latitude": 36.7850,
    "longitude": 3.5100,
    "google_maps_link": "https://www.google.com/maps?q=36.7850,3.5100"
  }
];
Map typs = {
  'hotel': Icons.hotel,
  'restaurant': Icons.restaurant,
  'beach': Icons.beach_access,
  'monument': Icons.monetization_on,
  'mosque': Icons.add_location,
  'park': Icons.park,
  'shopping center': Icons.shopping_cart,
  'university': Icons.school,
  'amusement park': Icons.directions_boat,
  'auberge': Icons.hotel
};
Map colors = {
  'hotel': Colors.red,
  'restaurant': Colors.green,
  'beach': Colors.blue,
  'monument': Colors.yellow,
  'mosque': Colors.purple,
  'park': Colors.orange,
  'shopping center': Colors.pink,
  'university': Colors.brown,
  'amusement park': Colors.grey,
  'auberge': Colors.black
};

class MapPage extends StatelessWidget {
  Future<position> _determinePosition() async {
    await p.determinePosition();
    return p;
  }

  List<Marker> monuments = locations
      .map((e) => Marker(
            width: 50.0,
            height: 50.0,
            point: LatLng(e['latitude'], e['longitude']),
            child: IconButton(
              iconSize: 20.0,
              color: colors[e['type']],
              onPressed: () async {},
              padding: EdgeInsets.all(0),
              constraints: BoxConstraints(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1C1B45),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  typs[e['type']],
                  color: colors[e['type']],
                ),
              ),
            ),
          ))
      .toList();
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
                initialZoom: 15.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.myapp',
                ),
                MarkerLayer(
                    markers:
                        monuments +  [
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
                ] 
                    ),
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
