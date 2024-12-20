import 'package:bsc_app/features/Map/logic/models/position.dart';
import 'package:bsc_app/features/Map/pages/map.dart';
import 'package:bsc_app/features/Servises/pages/acount_manegment.dart';
import 'package:bsc_app/features/Servises/pages/home.dart';
import 'package:bsc_app/features/Servises/pages/profile.dart';
import 'package:flutter/material.dart';

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
  late int _current;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _current = 0;
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // set the height here
        child: AppBar(
            title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.grey,
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
                  return Text('check your network',
                      style: TextStyle(color: Colors.red));
                } else {
                  return Text('Boumerdes,${snapshot.data?.cityName}',
                      style: TextStyle(color: Colors.grey));
                }
              },
            ),
          ],
        )),
      ),
      body: pages[_current],
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

            currentIndex: _current,
            onTap: (value) => setState(() => _current = value),
            backgroundColor: Color(
                0xFF1C1B45), // Dark background color for the BottomNavigationBar
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm_sharp), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
