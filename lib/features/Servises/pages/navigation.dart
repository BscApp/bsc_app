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
    AccManegment(username: 'islam'),
  ];
  late int _current;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _current = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0), // set the height here
        child: AppBar(
          title: Text('Your Location'),
        ),
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
            currentIndex: _current,
            onTap: (value) => setState(() => _current = value),
            backgroundColor: Color(
                0xFF1C1B45), // Dark background color for the BottomNavigationBar
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
