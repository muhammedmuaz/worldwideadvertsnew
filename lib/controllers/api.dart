import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:newapp/const/data_const.dart';
import 'package:newapp/models/affiliates_model.dart';
import 'package:newapp/models/car_rental_model.dart';
import 'package:newapp/models/user_model.dart';
import 'package:newapp/routing/app_navigator.dart';
import 'package:newapp/routing/app_route_names.dart';
import 'package:newapp/services/api_links.dart';
import 'package:newapp/services/api_services.dart';
import 'package:toastification/toastification.dart';
import '../models/listing_model.dart';
import '../utils/deaf_storage.dart';

class ApiCallbacks {
  static Future<void> login(
      String email, String password, BuildContext context) async {
// auth/login
    final reqBody = await ApiService.apiPostRequest(
        "https://api.worldwideadverts.info/api/v1/auth/login",
        jsonEncode({"email": email, "password": password}));
    final response = jsonDecode(reqBody);
    if (response['status'].toLowerCase() == "error") {
      toastification.show(
        context: context, // optional if you use ToastificationWrapper
        title: const Text('Login Unsuccessfull try again later!'),
        autoCloseDuration: const Duration(seconds: 3),
      );
    } else {
      log(response.toString());
      log(response['data'].toString());
      log(response['data']['access_token'].toString());

      DeafStorage.setValue(
          DataConstants.storageJWToken, response['data']['access_token']);
      toastification.show(
        context: context,
        title: const Text('SignUp Successfull!'),
        autoCloseDuration: const Duration(seconds: 3),
      );
      AppNavigation.removeAllRoutes(AppRoutesNames.homeScreen);
    }
  }

  static Future<void> signUp(String name, String lastname, String email,
      String password, BuildContext context) async {
// auth/login
    final reqBody = await ApiService.apiPostRequest(
        "https://api.worldwideadverts.info/api/v1/auth/register",
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

  static Future<List<Affiliates>> getAffiliates() async {
    final reqBody = await ApiService.apiGetRequest(
      "${ApiLinks.getAffiliates}?position=top&sort_type=asc&limit=10",
    );
    final response = jsonDecode(reqBody);
    List<Affiliates> affiliatesList = [];
    if (response['status'].toLowerCase() == "success") {
      for (var i = 0; i < response['data']['items'].length; i++) {
        affiliatesList.add(Affiliates.fromJson(response['data']['items'][i]));
      }
      return affiliatesList;
    }
    return [];
  }

  static Future<List<Listing>> getListings() async {
    final reqBody = await ApiService.apiPostRequest(
        ApiLinks.promotedListings,
        jsonEncode({}));
    try {
      final response = jsonDecode(reqBody);
      List<Listing> listings = [];
      print(response);
      if (response['status'].toLowerCase() == "success") {
        for (var i = 0; i < response['data']['items'].length; i++) {
          listings.add(Listing.fromJson(response['data']['items'][i]));
        }
        return listings;
      }
      return [];
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  static Future<UserModel> getUserDetails(BuildContext context) async {
// auth/login
    try {
      final reqBody = await ApiService.apiGetRequest(
        "https://api.worldwideadverts.info/api/v1/auth/user-profile",
      );
      final response = jsonDecode(reqBody);
      if (response['status'].toLowerCase() == "error") {
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          title: const Text('Unable to fetch user details!'),
          autoCloseDuration: const Duration(seconds: 3),
        );
        throw Exception("Error");
      } else {
        log(response['data'].toString());
        return UserModel.fromJson(response['data']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<CarRentalService>> fetchServices(String type,
      {double radius = 1000}) async {
    await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition();
    final response = await ApiService.apiGetRequest(
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${position.latitude},${position.longitude}&radius=$radius&types=$type&key=AIzaSyC8N54f56EleJZDVenZFLGSmCcOLs3UHUA",
    );
    List<dynamic> results = json.decode(response.body)['results'];
    return results.map((result) {
      final id = result['place_id'] ?? 'hello';
      final name = result['name'] ?? 'hello';
      final vicinity = result['vicinity'] ?? 'hello';
      final rating = result['rating']?.toDouble() ?? 0.0;
      final photoReference = result['photos']?[0]['photo_reference'];
      return CarRentalService(id, name, vicinity, rating, photoReference);
    }).toList();

    // mapPlacesFromJson(response);
  }

  static Future<void> forgotPassword(BuildContext context) async {
    final reqBody = await ApiService.apiPostRequest(
        "https://api.worldwideadverts.info/api/v1/auth/forgot-password",
        jsonEncode({}));
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
      print(e);
      throw Exception(e.toString());
    }
  }


}
