import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  const Transport({super.key});

  @override
  State<Transport> createState() => _TransportState();
}

List<String> trains = ['alger-boumerdes', 'alger-boumerdes', 'alger-boumerdes'];
List<String> Buses = ['alger-boumerdes', 'alger-boumerdes', 'alger-boumerdes'];

class _TransportState extends State<Transport> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Train',
              style: TextStyle(fontSize: 20, color: Colors.grey[800])),
          SizedBox(
            height: 3,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: trains.length,
            itemBuilder: (context, index) {
              return Container(
                height: 68,
                margin: EdgeInsets.fromLTRB(14, 0, 14, 20),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(trains[index],
                      style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                ),
              );
            },
          ),
          Text('Bus', style: TextStyle(fontSize: 20, color: Colors.grey[800])),
          SizedBox(
            height: 3,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: trains.length,
            itemBuilder: (context, index) {
              return Container(
                height: 68,
                margin: EdgeInsets.fromLTRB(14, 0, 14, 20),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(Buses[index],
                      style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
