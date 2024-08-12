// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class DeafStorage {
  static final DeafStorage _singleton =  DeafStorage._internal();
  static SharedPreferences? _sharedPreferences;
  factory DeafStorage() {
    return _singleton;
  }
  static initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance().whenComplete(()=> true
    );
  }

  static setValue(String key, String value) {
    _sharedPreferences!.setString(key, value);
  }

  static getValue(String key) {
    if (_sharedPreferences != null) {
      return _sharedPreferences!.getString(key);
    }
    return '';
  }

  static cleanData() {
    return _sharedPreferences!.clear();
  }

  DeafStorage._internal();
}