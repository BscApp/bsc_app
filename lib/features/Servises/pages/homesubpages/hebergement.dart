import 'package:flutter/material.dart';

class Hebergement extends StatefulWidget {
  const Hebergement({super.key});

  @override
  State<Hebergement> createState() => _HebergementState();
}

List<Map<String, dynamic>> _hebergement = [
  {
    'name': 'Hotel name',
    'type': 'hotel',
    'position': 'boumerdes',
    'image': 'path'
  },
  {
    'name': 'Hotel name',
    'type': 'hotel',
    'position': 'boumerdes',
    'image': 'path'
  },
  {
    'name': 'Hotel name',
    'type': 'hotel',
    'position': 'boumerdes',
    'image': 'path'
  }
];

class _HebergementState extends State<Hebergement> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _hebergement.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 41, vertical: 25),
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            children: [
              Container(
                height: 165,
              ),
              ListTile(
                subtitle: Text(
                    'type: ' +
                        _hebergement[index]['type'] +
                        '\nposition: ' +
                        _hebergement[index]['position'],
                    style: TextStyle(fontSize: 13, color: Colors.grey[800])),
                title: Text(_hebergement[index]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.grey[800])),
              ),
            ],
          ),
        );
      },
    );
    ;
  }
}
