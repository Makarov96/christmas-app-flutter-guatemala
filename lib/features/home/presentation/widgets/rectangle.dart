import 'package:flutter/material.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/handle_switcher.dart';
import 'package:provider/provider.dart';

class Rectangle extends StatelessWidget {
  const Rectangle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final myCustomSiwtcher = context?.watch<HandleSwitcher>();
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 400,
      ),
      height: screenHeight * 0.18,
      width: screenWidth * 0.15,
      curve: Curves.easeInCubic,
      margin: EdgeInsets.only(
        bottom: screenHeight * 0.25,
      ),
      decoration: BoxDecoration(
        color: myCustomSiwtcher.myswitch ? Colors.brown : Colors.grey,
      ),
    );
  }
}
