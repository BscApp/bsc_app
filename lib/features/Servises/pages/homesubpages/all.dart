import 'package:bsc_app/ai/ui/pages/ai_page.dart';
import 'package:bsc_app/hebergement/logic/models/heberge.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_bloc.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_state.dart';
import 'package:bsc_app/hebergement/ui/widgets/hebergeMiniCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class All_page extends StatefulWidget {
  final TabController tabController;
   All_page({super.key,required this.tabController});

  @override
  State<All_page> createState() => _All_pageState();
}
final contrel=PageController(initialPage: 0);
final boumrdess=['images/roock.png','images/beach.png','images/city.png'];
List<Map<String, dynamic>> LieuxTouristique_2 = [
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
            child: Text('Ask Our AI'),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChatPage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text('Message BSCAI',style:TextStyle(color: Colors.grey),),
                    Spacer(),
                    Image.asset('images/assistants.png',height: 30,width: 30,)
                  ],
                ),
              ),
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
                     ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
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
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset('assets/backgrounds/${LieuxTouristique_2[index]['background']}',fit: BoxFit.fill,)),
                        ),
                        SizedBox(height: 10,),
                        Text(LieuxTouristique_2[index]['name']),
                        SizedBox(height: 2,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                await _launchGoogleMaps(
                               LieuxTouristique_2[index]['map_position']);
                },
                                child: Image.asset('assets/icons/location.png',height: 17,width: 14,)),
                              SizedBox(width: 5,),
                              Text(LieuxTouristique_2[index]['position'],style: TextStyle(fontSize: 10, color: Colors.grey[800]),)
                            ],
                          ),
                        )
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
