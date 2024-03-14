import 'package:drivecare/src/config/init.dart';
import 'package:drivecare/src/config/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/utils/constants/routes.dart';
// import 'src/utils/constants/routes.dart';

void main()  async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...AppRouter.allProvider()],
      child: MaterialApp(
        title: 'Drive Care',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: Routes.welcome,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
