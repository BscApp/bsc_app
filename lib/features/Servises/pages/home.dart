import 'package:bsc_app/features/Servises/pages/homesubpages/all.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/hebergement.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/lieu_touristique.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/services.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/transport.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
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
          controller: tabController,
          isScrollable: true,
          labelStyle: TextStyle(
              fontSize: 16, // Bigger font size for selected tab
              fontWeight: FontWeight.bold,
              color: Colors.black // Bold style for selected tab
              ),
          unselectedLabelStyle:
              TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          labelPadding:
              EdgeInsets.symmetric(horizontal: 8.0), // Reduced spacing
          tabs: [
            Tab(
                child: Text(
              'All',
            )),
            Tab(
                child: Text(
              'Service',
            )),
            Tab(
                child: Text(
              'hebergement',
            )),
            Tab(
                child: Text(
              'Transport',
            )),
            Tab(
                child: Text(
              'Lieux Touristique',
            )),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              All_page(
                tabController: tabController,
              ),
              Services(),
              Hebergement(),
              Transport(),
              LieuxTouristique(),
            ],
          ),
        ),
      ],
    );
  }
}
