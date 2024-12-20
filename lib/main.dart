import 'package:bsc_app/features/Map/pages/map.dart';
import 'package:bsc_app/features/Servises/pages/navigation.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(splashColor: Colors.transparent),
      home: HomePage(),
    );
  }
}
