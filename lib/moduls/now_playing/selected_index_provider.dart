import 'package:flutter/foundation.dart';

class SelectedIndexProvider extends ChangeNotifier{
  int _currentIndex= 0;
  int get index => _currentIndex;

  void changeIndex(int newIndex){
    _currentIndex = newIndex;
    notifyListeners();
  }
}