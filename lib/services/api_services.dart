import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newapp/services/api_exceptions.dart';
import 'api_links.dart';
import 'app_host.dart';

class ApiService {
  static final client = http.Client();

  static Future<dynamic> apiGetRequest(String endPoint) async {
    dynamic response;
    try {
      response = await client.get(
        Uri.parse(ApiLinks.baseURL + endPoint),
        headers: AppHost.apiHeaders,
      );
    } on SocketException {
      throw FetchDataException(AppHost.apiExceptionMsg);
    } catch (e) {
      rethrow;
    }

    return _returnResponse(response);
  }

  static Future<dynamic> apiPostRequest(
      String endPoint, dynamic requestBody) async {
    dynamic response;
    try {
      response = await client.post(
        Uri.parse(ApiLinks.baseURL + endPoint),
        headers: AppHost.apiHeaders,
        body: requestBody,
        // encoding: encoding,
      );
    } on SocketException {
      throw FetchDataException(_returnResponse(response));
    }

    return _returnResponse(response);
  }

  static Future<dynamic> apiPutRequest(
      String endPoint, dynamic requestBody) async {
    dynamic response;
    try {
      response = await client.put(
        Uri.parse(ApiLinks.baseURL + endPoint),
        body: requestBody,
        headers: AppHost.apiHeaders,
      );
    } on SocketException {
      throw FetchDataException(AppHost.apiExceptionMsg);
    }

    return _returnResponse(response);
  }

  static Future<dynamic> apiPatchRequest(
      String endPoint, dynamic requestBody) async {
    dynamic response;

    try {
      response = await client.patch(
        Uri.parse(ApiLinks.baseURL + endPoint),
        headers: AppHost.apiHeaders,
        body: requestBody,
      );
    } on SocketException {
      throw FetchDataException(AppHost.apiExceptionMsg);
    }

    return _returnResponse(response);
  }

  static Future<dynamic> apiDeleteRequest(String endPoint, Object body) async {
    dynamic response;

    try {
      response = await client.delete(
        Uri.parse(ApiLinks.baseURL + endPoint),
        body: jsonEncode(body),
        headers: AppHost.apiHeaders,
      );
    } on SocketException {
      throw FetchDataException(AppHost.apiExceptionMsg);
    }

    return _returnResponse(response);
  }

  // static Future<Map<String, dynamic>> sendObject(var json) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(ApiLinks.baseURL + ApiLinks.uploadImage));
  //
  //
  //   log(json['path'] + 'path ++');
  //   var multipartFile = await http.MultipartFile.fromPath('image', json['path'],);
  //   request.files.add(multipartFile);
  //   // Send the request
  //   var response = await request.send();
  //   var response1 = await http.Response.fromStream(response);
  //   log(response1.body.toString() + 'response ++');
  //   var dec = jsonDecode(response1.body.toString());
  //   Map<String, dynamic> fResponse = dec;
  //
  //   // Check the response
  //   if (response.statusCode == 200) {
  //     return fResponse;
  //   } else {
  //     return fResponse;
  //   }
  // }
}

dynamic _returnResponse(http.Response response) {
  return response.body;
}