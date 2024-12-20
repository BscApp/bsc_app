import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}


List<Map<String, dynamic>> _services = [
  {
    'name': 'Hospital el Selam',
    'place': 'Avenue de l’Indépendance',
    'number': '024937582',
    'icon': Image.asset('images/hopital.png'),
  },
  {
    'name': 'Police',
    'place': 'Rue de la Police, Boumerdès',
    'number': '1548',
    'icon': Image.asset('images/police.png'),
  },
  {
    'name': 'Protection Civile',
    'place': 'Rue des Frères Mokrani, Boumerdès',
    'number': '14',
    'icon': Image.asset('images/protection.png'),
  },
];


class _ServicesState extends State<Services> {
  Future<void> callNumber(String phoneNumber) async {
  final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $phoneUri';
  }
}
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,

      itemCount: _services.length,

      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            height: 123,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(28),
            ),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    child: _services[index]['icon'],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_services[index]['name'],style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600),),
                      SizedBox(height: 5,),
                      if(_services[index]['place']!=null)
                      Row(
                        children: [
                          Icon(Icons.location_on_sharp),
                          Text(_services[index]['place'])
                        ],
                      ),
                      SizedBox(height: 8,),
                      GestureDetector(
                        onTap: () {
                          callNumber(_services[index]['number']);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.phone),
                            Text(_services[index]['number'])
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ),
        );
      },
    );
  }
}
