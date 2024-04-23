import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:drivecare/src/presentation/background/loginback.dart';
import 'package:drivecare/src/presentation/common/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants/routes.dart';
import '../provider/login_provider.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key, required this.children});
  final List<Widget> children;

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  int animationStatus = 0;
  late double deviceHeight, deviceWidth;

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
    final double circleSize = deviceWidth * 0.09;
    final double circlePositionTop = deviceHeight * 0.19;
    final double circlePositionLeft = deviceWidth * 0.15;
    return Consumer<LoginProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // color: Colors.orange,
          height: deviceHeight,
          width: deviceWidth,
          child: SafeArea(
            child: Stack(
              children: [
                // const Frame59(),
                LoginBackground(),
                Positioned(
                  top: deviceHeight * 0.1,
                  // left: -5,
                  width: deviceWidth,
                  child: Center(
                    child: AnimatedTextKit(
                      isRepeatingAnimation: true,
                      onTap: () {},
                      repeatForever: true,
                      animatedTexts: [
                        ScaleAnimatedText(
                          "Welcome Back To,\n  DriveCare",
                          textStyle: const TextStyle(
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                          duration: const Duration(milliseconds: 10000),
                          scalingFactor: 1.2,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: circlePositionTop + deviceHeight * 0.08,
                  left: circlePositionLeft - deviceHeight * 0.18,
                  child: Container(
                    width: circleSize * 12,
                    height: circleSize * 12,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(deviceHeight),
                    ),
                    child: Container(
                      height: deviceHeight,
                      width: deviceWidth,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          // widget.startTimer();
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: deviceHeight,
                              width: deviceWidth,
                              margin: EdgeInsets.only(
                                left: deviceWidth * 0.20,
                                bottom: deviceHeight * 0.12,
                              ),
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: deviceWidth * 0.8,
                                          margin: EdgeInsets.symmetric(
                                              vertical: deviceHeight * 0.02),
                                          child: const Center(
                                            child: Text(
                                              'Get Started',
                                              style: TextStyle(
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: deviceHeight * 0.01,
                                        ),
                                        LoginTextField(
                                          hintText: "Email",
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onChanged: (val) {
                                            setState(() {
                                              value.getEmailId(val!);
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: deviceHeight * 0.01,
                                        ),
                                        LoginTextField(
                                          showObscureText: true,
                                          hintText: "Password",
                                          onTap: () {
                                            // widget.startTimer();
                                          },
                                          onChanged: (val) {
                                            value.getPassword(val!);
                                          },
                                        ),
                                        SizedBox(
                                          height: deviceHeight * 0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("New User ?"),
                                            TextButton(
                                              onPressed: () {
                                                // widget.cancelTimer();
                                                Navigator.pushNamed(
                                                    context, Routes.usersignup);
                                              },
                                              child: const Text(
                                                'Register here',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   left: deviceWidth * 0.01,
                //   bottom: deviceHeight * 0.01,
                //   child: Container(
                //     height: deviceHeight * 0.05,
                //     margin: EdgeInsets.symmetric(
                //       horizontal: deviceHeight * 0.025,
                //       vertical: deviceHeight * 0.025,
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //               color: Colors.black,
                //             ),
                //             borderRadius: BorderRadius.circular(30),
                //           ),
                //           child: ToggleButtons(
                //             borderColor: Colors.transparent,
                //             selectedBorderColor: Colors.transparent,
                //             selectedColor: Colors.black,
                //             fillColor: Colors.transparent,
                //             borderRadius: BorderRadius.circular(22),
                //             isSelected: [value.isUser, !value.isUser],
                //             onPressed: (index) {
                //               value.toggleUserAndAdmin(index);
                //             },
                //             direction: Axis.horizontal,
                //             children: widget.children,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // // (animationStatus == 0)?
                Positioned(
                  // height: deviceHeight,
                  bottom: (value.canSkip)
                      ? deviceHeight * 0.18
                      : deviceHeight * 0.2,
                  right: deviceWidth * 0.31,
                  child: Container(
                    width: deviceWidth * 0.60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          height: deviceHeight * 0.05,
                          minWidth: deviceWidth * 0.4,
                          color: Colors.amber,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          // color:Themes.theme[Global.theme].primaryTextColor,
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            print('Pressed');
                            if (value.password != null) {
                              setState(() {
                                value.getContext(context);
                              });
                              print('on Submit');
                              await value.loginAsUser().then((value) {
                                if (value) {
                                  setState(() {
                                    animationStatus = 1;
                                  });
                                  _playAnimation();
                                }
                              });
                            }
                            // widget.cancelTimer();
                          },
                        ),
                      ],
                    ),
                  ),
                )
                //     : Container(
                //         height: deviceHeight,
                //         width: deviceWidth,
                //         child: UserStaggerAnimation(
                //           deviceWidth: deviceWidth,
                //           deviceHeight: deviceHeight,
                //           phone: phone ?? '',
                //           name: name ?? '',
                //           dob: dob ?? DateTime.now(),
                //           gender: gender ?? 'Male',
                //           buttonController: animationController,
                //         ),
                //       ),
                // const WEffect(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
