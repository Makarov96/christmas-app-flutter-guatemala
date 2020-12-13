import 'package:flutter/material.dart';

class HandleCurrentIndex with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  int _indexTab = 0;
  int get indexTab => _indexTab;

  int _indexPageview = 0;
  int get indexPageview => _indexPageview;

  void currentIndexPageview(int newIndex) {
    _indexPageview = newIndex;
    notifyListeners();
  }

  void updateIndex(int newIndex) {
    _index = newIndex;

    notifyListeners();
  }

  void updateIndexTab(int newIndexTab) {
    _indexTab = newIndexTab;

    notifyListeners();
  }
}
