import 'package:flutter/material.dart';

class All_page extends StatefulWidget {
  final TabController tabController;
   All_page({super.key,required this.tabController});

  @override
  State<All_page> createState() => _All_pageState();
}
final contrel=PageController(initialPage: 0);
final boumrdess=[Colors.amber,Colors.blueAccent,Colors.deepOrange];

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
              physics: NeverScrollableScrollPhysics(),
              controller: contrel,
              itemCount: 3,
              itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: boumrdess[index],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                       GestureDetector(
                         onTap: () {
                          contrel.animateToPage((index+2)%3, duration:Duration(microseconds: 100), curve:Curves.linear);
                         },
                         child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.navigate_before_rounded),
                          ),
                         ),
                       ),
                        Spacer(),
                        GestureDetector(
                        onTap: () {
                            contrel.animateToPage((index+1)%3, duration:Duration(microseconds: 100), curve:Curves.linear);
                        },
                         child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.navigate_next_rounded),
                          ),
                         ),
                       ),
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
            child: Row(
              children: [
                Text('hebergements'),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.tabController.animateTo(2);
                    });
                  },
                  child: Text('See all')),
                Icon(Icons.navigate_next_rounded)
              ],
            ),
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
            child: Row(
              children: [
                Text('Luie touristique'),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.tabController.animateTo(4);
                    });
                  },
                  child: Text('See all')),
                Icon(Icons.navigate_next_rounded)
              ],
            ),
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
