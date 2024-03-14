import 'package:drivecare/src/presentation/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/admin_login_page.dart';
import 'widgets/user_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    late double deviceHeight, deviceWidth;
    List<Widget> children(bool isUser, double buttonWidth) => [
        Container(
          height: deviceHeight * 0.031,
          width: buttonWidth,
          // padding: const EdgeInsets.all(5),
          margin: EdgeInsets.all(deviceHeight * 0.001),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(deviceHeight * 0.03,),
            border: (isUser)
                ? Border.all(
                    color: Colors.black,
                  )
                : Border.all(color: Colors.transparent),
            color: (isUser) ? Colors.white : Colors.transparent,
          ),
          child: const Center(
            child: Text('User'),
          ),
        ),
        Container(
          height: deviceHeight * 0.031,
          width: buttonWidth,
          margin: EdgeInsets.all(deviceHeight * 0.001),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(deviceHeight * 0.03,),
            border: (!isUser)
                ? Border.all(
                    color: Colors.black,
                  )
                : Border.all(color: Colors.transparent),
            color: (!isUser) ? Colors.white : Colors.transparent,
          ),
          child: const Center(
            child: Text('Admin'),
          ),
        )
      ];

  
  @override
   Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Consumer<LoginProvider>(
      builder: (context, value, child) => (value.isUser)
          ? UserLoginPage(
              // startTimer: startTimer,
              // cancelTimer: cancelTimer,
              children: children(value.isUser, deviceWidth * 0.16),
            )
          : AdminLoginPage(
              // startTimer: startTimer,
              // cancelTimer: cancelTimer,
              children: children(value.isUser, deviceWidth * 0.16),
            ),
    );
  }
}