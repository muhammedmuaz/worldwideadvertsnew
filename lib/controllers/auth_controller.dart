import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:newapp/routing/app_navigator.dart';
import 'package:newapp/routing/app_route_names.dart';
import 'package:newapp/services/api_links.dart';
import 'package:newapp/services/api_services.dart';
import 'package:toastification/toastification.dart';
import '../models/token_response_model.dart';

class AuthController {
  Future<TokenResponseModel> login(String email, String password) async {
    final reqBody = await ApiService.apiPostRequest(
        ApiLinks.login, jsonEncode({"email": email, "password": password}));
    final apiResponse = jsonDecode(reqBody);
    final response = TokenResponseModel.fromJson(apiResponse);
    if (response.status == "error") {
      return response;
    } else {
      return response;
    }
  }

  Future<void> signUp(String name, String lastname, String email,
      String password, BuildContext context) async {
// auth/login
    final reqBody = await ApiService.apiPostRequest(
        ApiLinks.register,
        jsonEncode({
          "first_name": name,
          "last_name": lastname,
          "email": email,
          "password": password,
          "password_confirmation": password
        }));
    final response = jsonDecode(reqBody);
    if (response['status'].toLowerCase() == "error") {
      toastification.show(
        // ignore: use_build_context_synchronously
        context: context,
        title: Text(response['message']),
        autoCloseDuration: const Duration(seconds: 3),
      );
    } else {
      toastification.show(
        // ignore: use_build_context_synchronously
        context: context,
        title: const Text('SignUp Successfull!'),
        autoCloseDuration: const Duration(seconds: 3),
      );
      AppNavigation.removeAllRoutes(AppRoutesNames.homeScreen);
    }
  }

  Future<void> forgotPassword(BuildContext context) async {
    final reqBody = await ApiService.apiPostRequest(
        ApiLinks.forgotPassword, jsonEncode({}));
    try {
      final response = jsonDecode(reqBody);
      if (response['status'].toLowerCase() == "error") {
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          title: const Text('Email not exists'),
          autoCloseDuration: const Duration(seconds: 3),
        );
      } else {
        toastification.show(
          context: context,
          title: Text(response['message']),
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}






// toastification.show(
//         context: context,
//         title: const Text('Login Unsuccessfull try again later!'),
//         autoCloseDuration: const Duration(seconds: 3),
//       );



// toastification.show(
//         context: context,
//         title: const Text('SignUp Successfull!'),
//         autoCloseDuration: const Duration(seconds: 3),
//       );
//       AppNavigation.removeAllRoutes(AppRoutesNames.homeScreen);