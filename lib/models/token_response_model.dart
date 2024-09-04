
import 'package:newapp/models/generic_model.dart';

class TokenResponseModel extends GenericModel {
  TokenDataModel data = TokenDataModel();

  TokenResponseModel();

  TokenResponseModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['data'] is Map<String, dynamic>) {
      data = TokenDataModel.fromJson(json['data'] as Map<String, dynamic>);
    }
  }
}

class TokenDataModel {
  String accessToken = '';
  String tokenType = '';
  int expiresIn = 0;

  TokenDataModel();

  TokenDataModel.fromJson(Map<String, dynamic> json) {
    if (json['access_token'] is String) {
      accessToken = json['access_token'];
    }
    if (json['token_type'] is String) {
      tokenType = json['token_type'];
    }
    if (json['expires_in'] is int) {
      expiresIn = json['expires_in'];
    }
  }
}
