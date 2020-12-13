import 'package:flutter/material.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/handle_switcher.dart';
import 'package:provider/provider.dart';

class CustomStar extends StatefulWidget {
  const CustomStar({Key key}) : super(key: key);

  @override
  _CustomStarState createState() => _CustomStarState();
}

class _CustomStarState extends State<CustomStar>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mycustomSwitcher = context?.watch<HandleSwitcher>();
    if (mycustomSwitcher.myswitch) {
      animationController.repeat();
    } else {
      animationController.stop();
    }
    double height = MediaQuery.of(context).size.height;
    final Tween<double> turnsTween = Tween<double>(
      begin: 1,
      end: 2,
    );

    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(
        top: height * 0.10,
      ),
      child: RotationTransition(
        turns: turnsTween.animate(
          animationController,
        ),
        child: AnimatedOpacity(
          opacity: mycustomSwitcher.myswitch ? 1 : 0,
          duration: animationController.duration,
          child: const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 80,
          ),
        ),
      ),
    );
  }
}
