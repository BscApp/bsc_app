import 'package:flutter/material.dart';

class state extends ChangeNotifier{
   int current=0;
   void changestate(int index){
    current=index;
    notifyListeners();
   }
}