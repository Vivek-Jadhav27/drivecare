import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:drivecare/src/utils/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/login_text_field.dart';
import '../provider/login_provider.dart';

class AdminLoginPage extends StatefulWidget {
  final List<Widget> children;

  const AdminLoginPage({super.key, required this.children});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage>
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
    return Consumer<LoginProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    // widget.startTimer();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // const Frame94(),
                      Positioned(
                        top: deviceHeight * 0.1,
                        left: deviceWidth * 0.2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 30, top: 10),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: true,
                            // onTap: () {},
                            repeatForever: true,
                            animatedTexts: [
                              TyperAnimatedText(
                                "Welcome To,\n DriveCare",
                                textStyle: const TextStyle(
                                  fontSize: 30,
                                ),
                                speed: const Duration(milliseconds: 100),
                                curve: Curves.ease,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: deviceHeight * 0.95,
                        width: deviceWidth,
                        padding:
                            EdgeInsets.fromLTRB(0, deviceHeight * 0.2, 0, 0),
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: deviceHeight * 0.10,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  LoginTextField(
                                    hintText: "AdminID",
                                    onTap: () {
                                      // widget.startTimer();
                                    },
                                    onChanged: (val) {
                                      value.getEmailId(val ?? "");
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  LoginTextField(
                                    showObscureText: true,
                                    hintText: "Password",
                                    onTap: () {
                                      // widget.startTimer();
                                    },
                                    onChanged: (val) {
                                      value.getPassword(val ?? "");
                                    },
                                  ),
                                  SizedBox(
                                    height: deviceHeight * 0.08,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("New Admin ?"),
                                      TextButton(
                                        onPressed: () {
                                          // widget.cancelTimer();
                                          Navigator.pushNamed(
                                              context, Routes.adminsignup);
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
                      Positioned(
                        left: deviceWidth * 0.01,
                        bottom: deviceHeight * 0.01,
                        child: Container(
                          height: deviceHeight * 0.05,
                          margin: EdgeInsets.symmetric(
                            horizontal: deviceHeight * 0.025,
                            vertical: deviceHeight * 0.025,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: ToggleButtons(
                                  borderColor: Colors.transparent,
                                  selectedBorderColor: Colors.transparent,
                                  selectedColor: Colors.black,
                                  fillColor: Colors.transparent,
                                  borderRadius: BorderRadius.circular(22),
                                  isSelected: [value.isUser, !value.isUser],
                                  onPressed: (index) {
                                    value.toggleUserAndAdmin(index);
                                  },
                                  direction: Axis.horizontal,
                                  children: widget.children,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // (animationStatus == 0)?
                      Positioned(
                        bottom: deviceHeight * 0.3,
                        child: MaterialButton(
                          height: deviceHeight * 0.05,
                          minWidth: deviceWidth * 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          // color: Themes.theme[Global.theme].secondaryColor,
                          child: const Text(
                            "Get Started",
                          ),
                          onPressed: () async {
                            print('Pressed');
                            if (value.password != null) {
                              setState(() {
                                value.getContext(context);
                              });
                              print('on Submit');
                              await value.loginAsAdmin().then((value) {
                                if (value) {
                                  setState(() {
                                    animationStatus = 1;
                                  });
                                 _playAnimation();
                                }
                              });
                            }
                          },
                        ),
                      )

                      //     : Container(
                      //         width: deviceWidth,
                      //         height: deviceHeight,
                      //         child: AdminStaggerAnimation(
                      //           deviceHeight: deviceHeight,
                      //           deviceWidth: deviceWidth,
                      //           buttonController: animationController,
                      //         ),
                      //       ),
                    ],
                  ),
                ),
                // const WEffect(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
