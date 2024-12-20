import 'package:bsc_app/ai/ui/pages/ai_page.dart';

import 'package:bsc_app/features/Map/logic/models/position.dart';
import 'package:bsc_app/features/Map/pages/map.dart';
import 'package:bsc_app/features/Servises/logic/meteo.dart';

import 'package:bsc_app/features/Servises/pages/acount_manegment.dart';
import 'package:bsc_app/features/Servises/pages/home.dart';
import 'package:bsc_app/features/Servises/pages/profile.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_bloc.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_event.dart';
import 'package:bsc_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    Home(),
    ProfilePage(username: 'islam', id: 'nkjb'),
    MapPage(),
    AccManegment(username: 'islam'),
  ];
  late int current;
  var temporare;
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    temporare= await MeteoService().fetchWeather();
  }
  void initState() {
    super.initState();
    current = 0;
  }
  

  position p = position();
  Future<position> _getCityName() async {
    await p.determinePosition();
    await p.getCityName();
    return p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () { 
        context.read<HebergeBloc>().add(HebergesEventFetch());
      }),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // set the height here
        child: AppBar(
            title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/location.png',
              height: 22,
              width: 18,
            ),
            FutureBuilder<position>(
              future: p.cityLoaded ? Future.value(p) : _getCityName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        color: Colors.grey, strokeWidth: 2),
                  );
                } else if (snapshot.hasError) {
                  return Text(' check your network',
                      style: TextStyle(color: Colors.red, fontSize: 16));
                } else {
                  return Text(' Boumerdes,${snapshot.data?.cityName}',
                      style: TextStyle(color: Colors.grey, fontSize: 16));
                }
              },
            ),
            Spacer(),
            if (temporare==null)
            FutureBuilder(future:MeteoService().fetchWeather(), builder:(context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('');
                } else if (snapshot.hasError) {
                  return Text('');
                } else {
                  return Text('${snapshot.data.toString()}°',
                      style: TextStyle(color: Colors.grey));
                }
            },),
            if (temporare!=null)
            Text('${temporare.toString()}°', style: TextStyle(color: Colors.grey))
          ],
        )),
      ),
      body: pages[current],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
            bottom: 20, left: 20, right: 20), // Add margin to the bottom
        height: 65, // Taller height for the bottom bar
        decoration: BoxDecoration(
          color:
              Colors.transparent, // Make the container background transparent
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,

            currentIndex: current,
            onTap: (value) => setState(() => current = value),
            backgroundColor: Color(
                0xFF1C1B45), // Dark background color for the BottomNavigationBar
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,

            items: [
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    'assets/icons/home.png',
                    height: 23,
                    width: 23,
                  ),
                  icon: Image.asset(
                    'assets/icons/home.png',
                    height: 23,
                    width: 23,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    'assets/icons/profile.png',
                    height: 23,
                    width: 23,
                  ),
                  icon: Image.asset(
                    'assets/icons/profile.png',
                    height: 23,
                    width: 23,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/map.png',
                    height: 23,
                    width: 23,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/map.png',
                    height: 23,
                    width: 23,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    'assets/icons/settings.png',
                    height: 23,
                    width: 23,
                  ),
                  icon: Image.asset(
                    'assets/icons/settings.png',
                    height: 23,
                    width: 23,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
