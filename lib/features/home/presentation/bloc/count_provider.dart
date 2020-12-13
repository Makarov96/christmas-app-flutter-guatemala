import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier {
  int _value = 1;
  int get value => _value;
  void rest() {
    _value < 1 ? _value = 0 : _value--;
    notifyListeners();
  }

  void sum() {
    _value++;
    notifyListeners();
  }
}
