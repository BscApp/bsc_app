import 'package:flutter/material.dart';

class All_page extends StatefulWidget {
  const All_page({super.key});

  @override
  State<All_page> createState() => _All_pageState();
}
final contrel=PageController();

class _All_pageState extends State<All_page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text('Ask our IA'),
          ),
          SizedBox(height: 10),
          Container(
            width: 490,
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(28),
            ),
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text('ask our ai'),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text('Boumerdes'),
          ),
          SizedBox(height: 10),
          Container(
            height: 181,
            child:PageView.builder(
              controller: contrel,
              itemCount: 5,
              itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            elevation:WidgetStatePropertyAll(0),
                          ),
                          onPressed:() {
                          
                        }, label: Icon(Icons.navigate_next_rounded)),
                        Spacer(),
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            elevation:WidgetStatePropertyAll(0),
                          ),
                          onPressed:() {
                          
                        }, label: Icon(Icons.navigate_next_rounded))
                      ],
                    ),
                  ),
                ),
              );
            },)
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text('hebergements'),
          ),
          SizedBox(height: 10),
          Container(
            height: 167,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 166,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(child: Text('Picture ${index + 1}')),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text('Complexes Touristiques'),
          ),
          SizedBox(height: 10),
          Container(
            height: 167,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 166,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(child: Text('Picture ${index + 1}')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
