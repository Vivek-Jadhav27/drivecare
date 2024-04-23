import 'package:flutter/material.dart';
import 'package:drivecare/src/config/global.dart';
import 'package:drivecare/src/utils/constants/hexcolor.dart';
import 'package:drivecare/src/utils/constants/theme.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        color: Themes.theme[Global.theme].primaryColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -0.5 * screenHeight, // Example to position at half negative of the screen height
            left: -0.2 * screenWidth, // Example for negative left offset
            child: Container(
              width: 1.35 * screenWidth, // 130% of the screen width
              height: 1.35 * screenWidth, // Square shaped
              decoration: BoxDecoration(
                color: Themes.theme[Global.theme].secondaryColor,
                borderRadius: BorderRadius.circular(screenWidth), // Fully rounded
              ),
            ),
          ),
          Positioned(
            top: 0.82 * screenHeight,
            left: 0.64 * screenWidth,
            child: Container(
              width: 0.56 * screenWidth, // 56% of the screen width
              height: 0.56 * screenWidth, // Square shaped
              decoration: BoxDecoration(
                color: Themes.theme[Global.theme].secondaryColor,
                borderRadius: BorderRadius.circular(0.56 * screenWidth), // Fully rounded
              ),
            ),
          ),
          Positioned(
            top: 0.41 * screenHeight,
            left: 0.53 * screenWidth,
            child: Container(
              width: 0.1 * screenWidth, // 10% of the screen width
              height: 0.1 * screenWidth, // Square shaped
              decoration: BoxDecoration(
                color: HexColor.fromHex('#FFEC88'),
                borderRadius: BorderRadius.circular(0.1 * screenWidth), // Fully rounded
              ),
            ),
          ),
          Positioned(
            top: 0.17 * screenHeight,
            left: 0.39 * screenWidth,
            child: Container(
              width: 0.1 * screenWidth, // 10% of the screen width
              height: 0.1 * screenWidth, // Square shaped
              decoration: BoxDecoration(
                color: Themes.theme[Global.theme].primaryColor,
                borderRadius: BorderRadius.circular(0.1 * screenWidth), // Fully rounded
              ),
            ),
          ),
        ],
      ),
    );
  }
}
