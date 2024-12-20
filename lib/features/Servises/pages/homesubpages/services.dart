import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}


List<Map<String, dynamic>> _services = [

  {
    'name': 'Hospital de boumrdes',
    'place': '',
    'number': '',
    'icon': Icons.ac_unit,
  },
  {
    'name': 'Service 2',
    'place': 'Place 2',
    'number': 'Number 2',
    'icon': Icons.ac_unit,
  },
  {
    'name': 'Service 3',
    'place': 'Place 3',
    'number': 'Number 3',
    'icon': Icons.ac_unit,
  },
];

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,

      itemCount: _services.length,

      itemBuilder: (context, index) {
        return Container(
          height: 123,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(28),
          ),
          child: ListTile(

            leading: Icon(_services[index]['icon']),
            subtitle: Text(
                'place: ' +
                    _services[index]['place'] +
                    '\nnumber: ' +
                    _services[index]['number'],
                style: TextStyle(fontSize: 16, color: Colors.grey[800])),
            title: Text(_services[index]['name'],

                style: TextStyle(fontSize: 20, color: Colors.grey[800])),
          ),
        );
      },
    );
  }
}
