import 'package:flutter/material.dart';

class CustomBackgroundColor extends StatelessWidget {
  CustomBackgroundColor({
    Key key,
    @required this.colorOne,
    @required this.colorTwo,
  }) : super(key: key);
  final Color colorOne;
  final Color colorTwo;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorOne,
            colorTwo,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.8,
            0.9,
          ],
        ),
      ),
    );
  }
}
