import 'package:flutter/material.dart';

class ScreensProvider with ChangeNotifier {
  int _screenIndex = 1;

  void setScreenIndex(int index) {
    _screenIndex = index;
    notifyListeners();
  }

  int getScreenIndex() => _screenIndex;
}
