import 'package:bsc_app/ai/ui/pages/ai_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AllPage extends StatefulWidget {
  final TabController tabController;
  const AllPage({super.key, required this.tabController});

  @override
  State<AllPage> createState() => _AllPageState();
}

final contrel = PageController(initialPage: 0);
final boumrdess = ['images/roock.png', 'images/beach.png', 'images/city.png'];
final List<Map<String, dynamic>> locations = [
  {
    "name": "El Walima Restaurant",
    "position": [36.7525, 3.4708],
    "locationString": "Boumerdes City Center",
    "link": "https://www.google.com/maps/place/El+Walima+Restaurant,+Boumerdes,+Algeria",
    "type": "Restaurant",
    'image': 'images/restau.png',
  },
  {
    "name": "Le Chalet Gourmand",
    "position": [36.7530, 3.4722],
    "locationString": "Rue de la Gare, Boumerdes",
    "link": "https://www.google.com/maps/place/Le+Chalet+Gourmand,+Boumerdes,+Algeria",
    "type": "Club",
    'image': 'images/club.png'
  },
  {
    "name": "raudi",
    "position": [36.7545, 3.4750],
    "locationString": "Near Wilaya de Boumerdes",
    "link": "https://www.google.com/maps/place/Bagna,+Boumerdes,+Algeria",
    "type": "Restaurant",
    'image': 'images/raudi.png'
  },
];

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: const Text('Ask Our AI'),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatPage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const Text('Message BSCAI', style: TextStyle(color: Colors.grey)),
                    const Spacer(),
                    Image.asset('images/assistants.png', height: 30, width: 30),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: const Text('Boumerdes',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          Container(
            height: 181,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: contrel,
              itemCount: boumrdess.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            boumrdess[index],
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
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
                                      contrel.animateToPage(
                                        (index + 2) % 3,
                                        duration: const Duration(milliseconds: 100),
                                        curve: Curves.linear,
                                      );
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(115, 255, 255, 255),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.navigate_before_rounded),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      contrel.animateToPage(
                                        (index + 1) % 3,
                                        duration: const Duration(milliseconds: 100),
                                        curve: Curves.linear,
                                      );
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(115, 255, 255, 255),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
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
              },
            ),
          ),
          const SizedBox(height: 10),
          Align(alignment: Alignment.centerLeft,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Complex Touristique', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 10.0, // Space between items horizontally
              mainAxisSpacing: 10.0, // Space between items vertically
              childAspectRatio: 1.0, // Adjust this to control item height vs width
            ),
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(212, 217, 217, 217), Color.fromARGB(140, 217, 217, 217)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.grey[200]!,
                            const Color.fromARGB(0, 224, 224, 224),
                          ]),
                          borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            locations[index]['image'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(locations[index]['name'],style:TextStyle(fontWeight: FontWeight.w700,color: Colors.grey[800])),
                      SizedBox(height: 15,),
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (locations[index]['link'] != null) {
                                  final Uri url = Uri.parse(locations[index]['link']);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                }
                              },
                              child: Text('Type :',style:TextStyle(fontSize: 12, color: Colors.grey[800],fontWeight: FontWeight.w700) ,)
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${locations[index]['type']}",
                              style: TextStyle(fontSize: 12, color: Colors.black45),
                            ),
                            Spacer(),
                            Image.asset('assets/icons/location.png',
                                  height: 17, width: 14)

                          ],
                        ),
                      ),
                      SizedBox(height: 4,),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
