import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_christmas_app/features/widgets/custom_navbar.dart';
import 'package:provider/provider.dart';

import '../../../../core/const/const.dart';
import '../../../widgets/custom_background_color.dart';
import '../../../widgets/snow_animation.dart';
import '../bloc/handle_audio.dart';
import '../bloc/handle_switcher.dart';
import '../widgets/custom_cupertino_switcher.dart';
import '../widgets/custom_star.dart';
import '../widgets/rectangle.dart';
import '../widgets/triangle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    context.watch<HandleAudio>().disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackgroundColor(
          colorOne: ConstValue.customcolorpurple,
          colorTwo: ConstValue.customcolorblue,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: const Rectangle(),
        ),
        Center(
          child: const Triangle(),
        ),
        CustomStar(),
        Container(
          child: SnowWidget(
            isRunning: context.watch<HandleSwitcher>().myswitch,
            totalSnow: 150,
            speed: 1,
          ),
        ),
        const CustomCupertinoSwitcher(),
        const CustomNavBar(),
      ],
    );
  }
}
