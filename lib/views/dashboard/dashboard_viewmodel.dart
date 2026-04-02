import 'package:flutter/material.dart';

class DashboardViewmodel extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void changePageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
