import 'package:flutter/cupertino.dart';


class BottomNavBarProvider extends ChangeNotifier {

  int _index = 1;

  int get index => _index;

  set index(int value){
    _index = value;
    notifyListeners();
  }


}