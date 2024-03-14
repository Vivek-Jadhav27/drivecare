// import 'package:drivecare/src/utils/constants/routes.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Route Not Found!!"),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to prev page"),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: Text("Back to login page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
