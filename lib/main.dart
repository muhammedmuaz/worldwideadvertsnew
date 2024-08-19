import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:newapp/services/api_links.dart';
import 'package:newapp/theme/deaf_theme.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toastification/toastification.dart';

import 'screens/home/home_screen.dart';

// Requesting Permission

Position? position;

void getLocation() async {
  try {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  } catch (e) {
    return;
  }

  // Do something with the obtained position
  print('Latitude: ${position!.latitude}');
  print('Longitude: ${position!.longitude}');
}

Future<void> requestPermission() async {
  final permissionStatus = await Permission.location.request();

  if (permissionStatus.isGranted) {
    getLocation();
  } else {}
}

void main() {
  ApiLinks.init(environment: EnvironmentFlavours.development);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    requestPermission();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
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
