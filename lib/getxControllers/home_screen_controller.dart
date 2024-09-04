import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:newapp/controllers/api.dart';
import 'package:share_plus/share_plus.dart';
import '../main.dart';
import '../models/affiliates_model.dart';
import '../services/api_services.dart';
import '../../models/listing_model.dart' as lsModel;

class HomeScreenController extends GetxController {
List<Affiliates> affiliates = [];
List<lsModel.Listing> listings = [];


  Future<void> getAffiliates() async {
    affiliates = await ApiCallbacks.getAffiliates();
    update();
  }

  Future<void> getListings() async {
    listings = await ApiCallbacks.getListings();
    update();
  }

}