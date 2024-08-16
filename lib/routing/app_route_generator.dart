import 'package:newapp/screens/authentication/change_password_screen.dart';
import 'package:newapp/screens/authentication/confirm_number_screen.dart';
import 'package:newapp/screens/authentication/forgot_password_screen.dart';
import 'package:newapp/screens/authentication/sign_in_screen.dart';
import 'package:newapp/screens/authentication/sign_up_screen.dart';
import 'package:newapp/screens/authentication/sign_up_success_screen.dart';
import 'package:newapp/screens/home/home_screen.dart';
import 'package:newapp/screens/menu/menu_screen.dart';
import 'package:newapp/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'app_route_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash
      case AppRoutesNames.initial:
        return _screenRoute(screen: const SplashScreen());
      // Auth
      case AppRoutesNames.signIn:
        return _screenRoute(screen: const SignInScreen());
      case AppRoutesNames.signUp:
        return _screenRoute(screen: const SignUpScreen());
      case AppRoutesNames.signUpSuccess:
        return _screenRoute(screen: const SignUpSuccessScreen());
      case AppRoutesNames.forgortPassword:
        return _screenRoute(screen: const ForgotPasswordScreen());
      case AppRoutesNames.confirmNumber:
        return _screenRoute(screen: const ConfirmNumberScreen());
      case AppRoutesNames.changePassword:
        return _screenRoute(screen: const ChangePasswordScreen());
      // Home and Menu
      case AppRoutesNames.homeScreen:
        return _screenRoute(screen: const HomeScreen());
      case AppRoutesNames.menuScreen:
        return _screenRoute(screen: const MenuScreen());
      // case AppRoutesNames.listingDetailPage:
      //   return _screenRoute(screen: const ListingDetailPage());        
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _screenRoute({Widget? screen}) {
    return MaterialPageRoute(builder: (context) => screen!);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Something went wrong',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans',
                  color: Color(0xff2D3139))),
        ),
      );
    });
  }
}
