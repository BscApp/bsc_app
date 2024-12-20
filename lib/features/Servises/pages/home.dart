import 'package:bsc_app/features/Servises/pages/homesubpages/all.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/hebergement.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/lieu_touristique.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/transport.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

TabController? _tabController;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            fillColor: Color(0xFFF2F2F2),
            filled: true,
            hintText: ' Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        TabBar(tabs: [
          Tab(
            text: 'All',
          ),
          Tab(
            text: 'Hebergement',
          ),
          Tab(
            text: 'Transport',
          ),
          Tab(
            text: 'Lieux Touristiques',
          ),
        ]),
        TabBarView(
          controller: _tabController,
          children: [
            All_page(),
            Hebergement(),
            Transport(),
            LieuxTouristique(),
          ],
        ),
      ],
    );
  }
}
