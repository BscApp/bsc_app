
import 'package:bsc_app/ai/logic/repo/ai_repo.dart';
import 'package:bsc_app/ai/ui/bloc/ai_bloc.dart';
import 'package:bsc_app/features/Servises/pages/homesubpages/hebergement.dart';
import 'package:bsc_app/features/Servises/pages/navigation.dart';
import 'package:bsc_app/hebergement/ui/bloc/heberge_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
   MultiBlocProvider(providers: [
     BlocProvider(  create: (context)=>AiBloc(AiRepo()),child: MyApp(), ),
     BlocProvider( create: (context)=>HebergeBloc(),child: Hebergement(),)
    ], child: MyApp(),));
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
