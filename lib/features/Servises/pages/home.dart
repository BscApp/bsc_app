import 'package:bsc_app/features/Servises/pages/homesubpages/all.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/hebergement.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/services.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/transport.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              decoration: InputDecoration(
            fillColor: Color(0xFFF2F2F2),
            filled: true,
            hintText: ' Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
          )),
        ),
        TabBar(
          tabAlignment: TabAlignment.center,
          dividerColor: Colors.transparent,
          controller: _tabController,
          isScrollable: true,
          labelPadding:
              EdgeInsets.symmetric(horizontal: 8.0), // Reduced spacing
          tabs: [
            Tab(
                child: Text('All',
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
            Tab(
                child: Text('Service',
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
            Tab(
                child: Text('hebergement',
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
            Tab(
                child: Text('Transport',
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
            Tab(
                child: Text('Lieu Touristique',
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              All_page(),
              Services(),
              Hebergement(),
              Transport(),
              All_page(),
            ],
          ),
        ),
      ],
    );
  }
}
