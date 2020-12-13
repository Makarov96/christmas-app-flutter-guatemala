import 'package:flutter/material.dart';
import '../bloc/generate_random_offsets.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_clipper.dart';
import '../../../widgets/light.dart';
import '../bloc/handle_switcher.dart';

class Triangle extends StatefulWidget {
  const Triangle({Key key}) : super(key: key);

  @override
  _TriangleState createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    super.initState();
  }

  static final _offsets =
      GenerateRandomOffset.generateOffsets(44, 0.05).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final myCustomSiwtcher = context?.watch<HandleSwitcher>();
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.15,
        bottom: screenHeight * 0.4,
      ),
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 400,
          ),
          curve: Curves.easeInCubic,
          height: screenHeight * 0.5,
          width: screenWidth * 0.7,
          child: Stack(
            children: [
              SizedBox(
                height: 38,
              ),
              AnimatedOpacity(
                opacity: myCustomSiwtcher.myswitch ? 1.0 : 0.0,
                duration: Duration(
                  milliseconds: 400,
                ),
                child: ListView(
                  children: [
                    for (final x in _offsets)
                      Light(
                        x: x,
                      ),
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: myCustomSiwtcher.myswitch ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}
