import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LieuxTouristique extends StatefulWidget {
  const LieuxTouristique({super.key});

  @override
  State<LieuxTouristique> createState() => _LieuxTouristiqueState();
}

List<Map<String, dynamic>> _LieuxTouristique = [
  {
    'name': 'Elmnara',
    'map_position': 'https://maps.app.goo.gl/mCxV8Gb6o7Bnk2MK8',
    'position': 'Dellys - Boumerdes, Algeria',
    'background': 'bg1.png'
  },
  {
    'name': 'Phare de cap Bengut',
    'map_position': 'https://maps.app.goo.gl/36B2BcopQKxXJqZTA',
    'position': 'Dellys - Boumerdes, Algeria',
    'background': 'bg2.png'
  },
  {
    'name': 'Bouzegza Mountain',
    'map_position': 'https://maps.app.goo.gl/9bheNvkHgmi1F97v6',
    'position': 'Keddara Municipality-Boudouaou',
    'background': 'bg3.png'
  }
];
Future<void> _launchGoogleMaps(googleMapsUrl) async {
  final Uri url = Uri.parse(googleMapsUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $googleMapsUrl';
  }
}

class _LieuxTouristiqueState extends State<LieuxTouristique> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _LieuxTouristique.length,
      itemBuilder: (context, index) {
        return Container(
          height: 123,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/backgrounds/${_LieuxTouristique[index]['background']}'),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFD9D9D9).withOpacity(0.4),
                      Color(0xFFD9D9D9).withOpacity(0.6),
                      Color(0xFFD9D9D9).withOpacity(0.8),
                      Color(0xFFD9D9D9),
                      Color(0xFFD9D9D9),
                      Color(0xFFD9D9D9),
                      Color(0xFFD9D9D9),
                      Color(0xFFD9D9D9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              ListTile(
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 74),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/location.png',
                        height: 17,
                        width: 14,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(_LieuxTouristique[index]['position'],
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[800])),
                    ],
                  ),
                ),
                title: Text(_LieuxTouristique[index]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.grey[800])),
                onTap: () async {
                  await _launchGoogleMaps(
                      _LieuxTouristique[index]['map_position']);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
