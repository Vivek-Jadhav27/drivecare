import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/login_text_field.dart';
import 'providers/admin_signup_provider.dart';

class AdminSignupPage extends StatefulWidget {
  const AdminSignupPage({super.key});

  @override
  State<AdminSignupPage> createState() => _AdminSignupPageState();
}

class _AdminSignupPageState extends State<AdminSignupPage>
    with TickerProviderStateMixin {
  late double deviceHeight, deviceWidth;
  late AnimationController animationController;
  int animationStatus = 0;
  String? confirmPassword;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Consumer<AdminSignUpProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // const Frame94(),
                Container(
                  height: deviceHeight,
                  width: deviceWidth,
                  padding: EdgeInsets.fromLTRB(0, deviceHeight * 0.05, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome To,\nOur Company.",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.09,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Signup",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            LoginTextField(
                              hintText: "Garrage Name",
                              onChanged: (val) {
                                value.getGaragename(val!);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LoginTextField(
                              hintText: "Name",
                              onChanged: (val) {
                                value.getName(val!);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LoginTextField(
                              hintText: "Email Id",
                              onChanged: (val) {
                                value.getEmailId(val!);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LoginTextField(
                              hintText: "Mobile No",
                              onChanged: (val) {
                                value.getPhone(val!);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LoginTextField(
                              showObscureText: true,
                              hintText: "Password",
                              onChanged: (val) {
                                value.getPassword(val!);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LoginTextField(
                              showObscureText: true,
                              hintText: "Confirm Password",
                              onChanged: (val) {
                                setState(() {
                                  confirmPassword = val;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            MaterialButton(
                              height: deviceHeight * 0.05,
                              minWidth: deviceWidth * 0.4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              // color: HexColor.fromHex('#F9ED9A'),
                              child: const Text(
                                "Get Started",
                              ),
                              onPressed: () async {
                                value.getContext(context);
                                if (value.password == confirmPassword) {
                                  await value.onSubmit().then((value) {
                                    if (value) {
                                      setState(() {
                                        animationStatus = 1;
                                      });
                                      // _playAnimation();
                                    }
                                  });
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // (animationStatus == 0)?
                
                // Positioned(
                //   bottom: deviceHeight * 0.19,
                //   child: MaterialButton(
                //     height: deviceHeight * 0.05,
                //     minWidth: deviceWidth * 0.4,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //     // color: HexColor.fromHex('#F9ED9A'),
                //     child: const Text(
                //       "Get Started",
                //     ),
                //     onPressed: () async {
                //       if (value.password == confirmPassword) {
                //         await value.onSubmit().then((value) {
                //           if (value) {
                //             setState(() {
                //               animationStatus = 1;
                //             });
                //             _playAnimation();
                //           }
                //         });
                //       }
                //     },
                //   ),
                // )

                // : Container(
                //     height: deviceHeight,
                //     width: deviceWidth,
                //     child: StoreSignUpStaggerAnimation(
                //       deviceHeight: deviceHeight,
                //       deviceWidth: deviceWidth,
                //       buttonController: animationController,
                //     ),
                //   ),
                // WEffect(),
                //  Padding(
                //    padding: const EdgeInsets.only(top:480,left:230),
                //    child: GestureDetector(
                //     onTap: (){
                //       Navigator.push(
                //         context,
                //          MaterialPageRoute(builder: ((context) {
                //            return EmailPage();
                //          })),);

                //     },
                //     child: Text("Login",
                //     style: TextStyle(fontSize: 20,color: Colors.black),)),
                //  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
