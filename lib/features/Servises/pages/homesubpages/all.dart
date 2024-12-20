import 'package:bsc_app/ai/ui/pages/ai_page.dart';
import 'package:flutter/material.dart';

class All_page extends StatefulWidget {
  final TabController tabController;
   All_page({super.key,required this.tabController});

  @override
  State<All_page> createState() => _All_pageState();
}
final contrel=PageController(initialPage: 0);
final boumrdess=['images/roock.png','images/beach.png','images/city.png'];

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
          GestureDetector(
            onTap: (){


        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChatPage()));
            },
            child: Container(
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
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.asset(boumrdess[index],fit: BoxFit.fill,width: double.infinity,height: double.infinity,)),
                      Positioned(
                        left: 10,
                        right: 10,
                        top: 55,
                        child: Container(
                          height: 80,
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
                                    color: const Color.fromARGB(115, 255, 255, 255)
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
                                    color: const Color.fromARGB(115, 255, 255, 255)
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
                      ),
                    ],
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
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      children: [
                        Container(
                       
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('The name of the place'),
                        SizedBox(height: 2,),
                        Text('Type: Camp'),
                      ],
                    ),
                  ),
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
                Text('Lieux touristique'),
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
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      children: [
                        Container(
                       
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('The name of the place')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
