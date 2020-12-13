import 'package:flutter/cupertino.dart';

class HandleSwitcher with ChangeNotifier {
  bool _switch = false;
  bool get myswitch => _switch;

  void changeValueSwitch(bool newValue) {
    _switch = newValue;
    notifyListeners();
  }
}
