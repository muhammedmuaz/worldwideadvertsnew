import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/controllers/auth_controller.dart';
import 'package:newapp/utils/deaf_storage.dart';
import 'package:toastification/toastification.dart';

import '../const/data_const.dart';
import '../routing/app_navigator.dart';
import '../routing/app_route_names.dart';

class AuthControllerGetx extends GetxController {
  final _autController = AuthController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(
      String email, String password, BuildContext context) async {
    _isLoading = true;
    update();
    final response = await _autController.login(email, password);
    toastification.show(
      // ignore: use_build_context_synchronously
      context: context,
      title: Text(response.message),
      autoCloseDuration: const Duration(seconds: 3),
    );
    if (response.status != "error") {
      DeafStorage.setValue(
          DataConstants.storageJWToken, response.data.accessToken);
      AppNavigation.removeAllRoutes(AppRoutesNames.homeScreen);
    }
    _isLoading = false;
    update();
  }
}
