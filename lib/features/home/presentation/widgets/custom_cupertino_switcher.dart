import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/handle_audio.dart';
import '../bloc/handle_switcher.dart';

class CustomCupertinoSwitcher extends StatelessWidget {
  const CustomCupertinoSwitcher({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final myCustomSiwtcher = context.watch<HandleSwitcher>();
    final myHandleAudio = context.watch<HandleAudio>();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          bottom: screenHeight * 0.12,
        ),
        child: CupertinoSwitch(
          trackColor: Colors.red,
          activeColor: Colors.green,
          value: myCustomSiwtcher.myswitch,
          onChanged: (value) {
            myCustomSiwtcher.changeValueSwitch(value);
            myHandleAudio.handleAudio(value);
          },
        ),
      ),
    );
  }
}
