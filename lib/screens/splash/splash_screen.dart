import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/routing/app_navigator.dart';
import 'package:newapp/routing/app_route_names.dart';
import 'package:newapp/services/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getDetails() async {
    try {
      Future.delayed(const Duration(seconds: 2), () {
      // if (token.isNotEmpty) {
      //   AppNavigation.navigateTo(AppRoutesNames.homeScreen);
      // } else {
        AppNavigation.navigateTo(AppRoutesNames.signIn);
      // }
    });
    // await DeafStorage.initialize();
    // final String token =
    //     await DeafStorage.getValue(DataConstants.storageJWToken);
    // Future.delayed(const Duration(seconds: 2), () {
    //   if (token.isNotEmpty) {
    //     AppNavigation.navigateTo(AppRoutesNames.homeScreen);
    //   } else {
    //     AppNavigation.navigateTo(AppRoutesNames.signIn);
    //   }
    // });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DeafAssetImage(
          imagePath: AppImages.appLogo,
          scale: 3.5,
        ),
      ),
    );
  }
}
