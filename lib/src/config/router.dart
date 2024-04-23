import 'package:drivecare/src/data/models/app_route.dart';
import 'package:drivecare/src/presentation/customer/customer_main_page.dart';
import 'package:drivecare/src/presentation/customer/providers/customer_cart_provider.dart';
import 'package:drivecare/src/presentation/customer/providers/customer_service_provider.dart';
import 'package:drivecare/src/presentation/customer/widgets/customer_home_page.dart';
import 'package:drivecare/src/presentation/customer/widgets/customer_profile_page.dart';
import 'package:drivecare/src/presentation/login/login_page.dart';
import 'package:drivecare/src/presentation/signup/admin_signup_page.dart';
import 'package:drivecare/src/presentation/signup/providers/admin_signup_provider.dart';
import 'package:drivecare/src/presentation/signup/providers/user_signup_provider.dart';
import 'package:drivecare/src/presentation/signup/user_signup_page.dart';
import 'package:drivecare/src/presentation/welcome/welcome_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presentation/error/error_page.dart';
import '../presentation/login/provider/login_provider.dart';
// import '../presentation/signup/garrage_signup_page.dart';
import '../utils/constants/routes.dart';

class AppRouter {
  static List<AppRoute> routes() => [
        AppRoute(route: Routes.welcome, view: const WelcomePage()),
        AppRoute(route: Routes.login, view: const LoginPage()),
        AppRoute(route: Routes.usersignup, view: const UserSignupPage()),
        AppRoute(route: Routes.adminsignup, view: const AdminSignupPage()),
        AppRoute(route: Routes.customermainpage, view: const CustomerMainPage()),
        AppRoute(route: Routes.customerhomepage, view: const CustomerHomePage()),
        AppRoute(route: Routes.customermainpage, view: const CustomerMainPage()),
        AppRoute(route: Routes.customerprofilepage,view: const CustomerProfilePage()),
        // AppRoute(route: Routes.garagesignuppage, view: const GarageSignUpPage()),
      ];

  static Route onGenerateRoute(RouteSettings settings) {
    if (settings.name!.isNotEmpty) {
      String nextRoute = settings.name!;
      if (kDebugMode) {
        print(nextRoute);
      }

      // if (StoreRepository.storeId == null && nextRoute == Routes.login) {
      //   nextRoute = Routes.registerStore;
      // }
      // if (nextRoute == Routes.registerStore) {
      //   nextRoute = Routes.login;
      // }
      Iterable<AppRoute> result = routes().where(
        (element) => element.route == nextRoute,
      );
      if (result.isNotEmpty) {
        // return MaterialPageRoute(builder: (context) => result.first.view);
        return createRoute(result.first.view);
      } else {
        return MaterialPageRoute(builder: (context) => const ErrorPage());
      }
    }
    return MaterialPageRoute(builder: (context) => const ErrorPage());
  }

  static Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(
        seconds: 2,
      ),
      reverseTransitionDuration: const Duration(
        seconds: 1,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 5.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static List allProvider() => [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => UserSignUpProvider()),
        ChangeNotifierProvider(create: (context) => AdminSignUpProvider()),
        ChangeNotifierProvider(create: (context) => CustomerSerivceProvider()),
        ChangeNotifierProvider(create: (context) => CustomerCartProvider()),
      ];
}
