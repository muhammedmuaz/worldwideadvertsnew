import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarRentalService {
  final String? id;
  final String? name;
  final String? vicinity;
  final double? rating;
  final String? photoReference;

  CarRentalService(
      this.id, this.name, this.vicinity, this.rating, this.photoReference);
}

class CarServiceGoogleDetailModel {
  String phoneNumber = '';
  String address = '';
  String website = '';
  List<String> weekdays = [];
  LatLng coordinates = const LatLng(0.0, 0.0);
  List<Review> reviews = [];

  CarServiceGoogleDetailModel(this.phoneNumber, this.address, this.website,
      this.weekdays, this.coordinates, this.reviews);
}

class Review {
  String authorName = '';
  String description = '';
  Review({required this.authorName, required this.description});
}
