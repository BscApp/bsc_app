import 'package:flutter/material.dart';

class LieuxTouristique extends StatefulWidget {
  const LieuxTouristique({super.key});

  @override
  State<LieuxTouristique> createState() => _LieuxTouristiqueState();
}

List<Map<String, dynamic>> _LieuxTouristique = [
  {
    'name': 'deles',
    'map_position': 'link',
    'position': 'boumerdes',
  },
  {
    'name': 'corso',
    'map_position': 'link',
    'position': 'boumerdes',
  },
  {
    'name': 'darchabab',
    'map_position': 'link',
    'position': 'boumerdes',
  }
];

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
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(28),
          ),
          child: ListTile(
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 74),
              child: Text(
                  'type: ' +
                      _LieuxTouristique[index]['position'] +
                      '\nposition: ' +
                      _LieuxTouristique[index]['map_position'],
                  style: TextStyle(fontSize: 13, color: Colors.grey[800])),
            ),
            title: Text(_LieuxTouristique[index]['name'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.grey[800])),
          ),
        );
      },
    );
  }
}
