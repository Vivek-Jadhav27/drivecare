import 'package:drivecare/src/config/global.dart';
import 'package:drivecare/src/utils/constants/theme.dart';
import 'package:flutter/material.dart';

class Frame94 extends StatelessWidget {
  const Frame94({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final double containerWidth = screenSize.width;
    final double containerHeight = screenSize.height;
    final double circleSize1 = screenSize.width * 1.2;
    final double circleSize2 = screenSize.width * 0.555;
    final double circleSize3 = screenSize.width * 0.0926;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: Themes.theme[Global.theme].primaryColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -containerHeight * 0.3104,
            left: -containerWidth * 0.1148,
            child: Container(
              width: circleSize1,
              height: circleSize1 + 50,
              decoration: BoxDecoration(
                color: Themes.theme[Global.theme].secondaryColor,
                borderRadius: BorderRadius.all(
                    Radius.elliptical(circleSize1, circleSize1)),
              ),
            ),
          ),
          Positioned(
            top: containerHeight * 0.8224,
            left: containerWidth * 0.64,
            child: Container(
              width: circleSize2,
              height: circleSize2,
              decoration: BoxDecoration(
                color: Themes.theme[Global.theme].secondaryColor,
                borderRadius: BorderRadius.all(
                    Radius.elliptical(circleSize2, circleSize2)),
              ),
            ),
          ),
          Positioned(
            top: containerHeight * 0.4125,
            left: containerWidth * 0.3954 + 50,
            child: Container(
              width: circleSize3,
              height: circleSize3,
              decoration: BoxDecoration(
                color:  Themes.theme[Global.theme].secondaryColor,
                borderRadius: BorderRadius.all(
                    Radius.elliptical(circleSize3, circleSize3)),
              ),
            ),
          ),
          Positioned(
            top: containerHeight * 0.1724,
            left: containerWidth * 0.3935,
            child: Container(
              width: circleSize3,
              height: circleSize3,
              decoration: BoxDecoration(
                color: Themes.theme[Global.theme].primaryColor,
                borderRadius: BorderRadius.all(
                    Radius.elliptical(circleSize3, circleSize3)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
