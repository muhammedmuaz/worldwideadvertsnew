import 'dart:convert';

import 'package:newapp/const/data_const.dart';

import '../utils/deaf_storage.dart';


class AppHost {
  static const String apiExceptionMsg = "Try Again Later.";
  static const String apiBadResponseMsg = 'Bad Response.';
  static const String noInternetMsg =
      'No Internet Connection. Connect Your Internet & Try Again.';

  static const int apiSuccessCode = 200;
  static const int apiErrorCode = 200;

  static dynamic apiHeaders = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer ${DeafStorage.getValue(DataConstants.storageJWToken)}'
  };

  final encoding = Encoding.getByName('utf-8');

  static updateHeaders() {
    apiHeaders = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${DeafStorage.getValue(DataConstants.storageJWToken)}'
    };
  }

// static String accessToken = "";
// static String expiration = "";

// static String deviceId = "";
// static String deviceType = ""; // android / ios
// static String fcmToken = "";
}