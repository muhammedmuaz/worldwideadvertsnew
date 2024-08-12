class ApiLinks {
  static void init({
    required EnvironmentFlavours environment,
  }) {
    if (environment == EnvironmentFlavours.development) {
      baseURL = _developmentURL;
      baseURLImage = _developmentImageURL;
    } else if (environment == EnvironmentFlavours.production) {
      baseURL = _productionURL;
      baseURLImage = _productionImageURL;
    } else if (environment == EnvironmentFlavours.local) {
      baseURL = _localURL;
      baseURLImage = _localImageURL;
    }
  }

  //base URL
  // test base URL
  static late final String baseURL;
  static late final String baseURLImage;

  static const String _developmentURL = "";
  static const String _productionURL = '';
  static const String _localURL = '';
  //test base Image URL
  static const String _developmentImageURL = "";
  static const String _productionImageURL = '';
  static const String _localImageURL = '';

  // imageUrl
  static final String imagesUrl = '$baseURL/Images/';

  // Socket Url
  static late final String socketUrl = '$baseURL/socket';

  // live base URL
  //static const String baseURL = "";
  
}

enum EnvironmentFlavours {
  development, //for developers
  production,
  local,
}