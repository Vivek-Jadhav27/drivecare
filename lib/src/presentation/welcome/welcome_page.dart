import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';

import '../../config/global.dart';
import '../../utils/constants/routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        //backgroundColor: Themes.theme[Global.theme].secondaryColor,
        body: GestureDetector(
      onTap: () {
        Global.isloggedin ? Navigator.pushNamed(context, Routes.customermainpage) : Navigator.pushNamed(context, Routes.login); 
       
      },
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RippleAnimation(
                    size: const Size(200, 200),
                    repeat: true,
                    ripplesCount: 1,
                    minRadius: 200,
                    // color: Themes.theme[Global.theme].primaryColor,
                    child: Image.asset(
                      'assets/images/welcome.png',
                      fit: BoxFit.cover,
                      height: screenHeight,
                      width: screenWidth,
                    ),
                  ),
                  const Text(
                    'Drive Care',
                    style: TextStyle(
                      fontFamily: 'Italianno',
                      fontSize: 64,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Where Speed Meets Service!"',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
