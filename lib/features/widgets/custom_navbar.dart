import 'dart:ui';
import 'package:flutter_christmas_app/features/home/presentation/bloc/handle_audio.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/handle_curren_index.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/handle_switcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.9,
            margin: EdgeInsets.only(
              bottom: screenHeight * 0.03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                2,
                (index) => CustomCircleButton(
                  onPressed: () {
                    context.read<HandleCurrentIndex>().updateIndex(index);
                    // context.read<HandleSwitcher>().changeValueSwitch(false);
                    //   context.read<HandleAudio>().handleAudio(false);
                  },
                  index: index,
                ),
                growable: false,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    Key key,
    @required this.index,
    @required this.onPressed,
  }) : super(key: key);
  final int index;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: screenHeight * 0.08,
        width: screenWidth * 0.08,
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
              color: context.watch<HandleCurrentIndex>().index == index
                  ? Colors.white
                  : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.watch<HandleCurrentIndex>().index == index
              ? Colors.green
              : Colors.transparent,
          border: Border.all(
            color: Colors.red,
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
