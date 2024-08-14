import 'package:newapp/routing/app_navigator.dart';
import 'package:newapp/routing/app_route_generator.dart';
import 'package:newapp/routing/app_route_names.dart';
import 'package:newapp/services/api_links.dart';
import 'package:newapp/theme/deaf_theme.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'screens/home/home_screen.dart';

void main() {
  ApiLinks.init(environment: EnvironmentFlavours.development);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: 'World Wode Adverts',
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: Theme(
              data: DeafTheme.lightTheme,
              child: child!,
            )),
            home: const HomeScreen(),
        // initialRoute: AppRoutesNames.initial,
        // navigatorKey: AppNavigation.navigatorKey,
        // onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
