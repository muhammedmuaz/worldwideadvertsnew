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

  static const String _developmentURL = "https://api.worldwideadverts.info/api/v1";
  static const String _productionURL = "https://api.worldwideadverts.info/api/v1";
  static const String _localURL = '';
  //test base Image URL
  static const String _developmentImageURL = "";
  static const String _productionImageURL = '';
  static const String _localImageURL = '';

  // imageUrl
  static final String imagesUrl = '$baseURL/Images/';

  // Socket Url
  static final String socketUrl = '$baseURL/socket';

  // live base URL
  //static const String baseURL = "";

  static const String getAffiliates = "/affiliate";
  static const String promotedListings = "/listing/promoted";
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String forgotPassword = "/auth/forgot-password";



  
}

enum EnvironmentFlavours {
  development, //for developers
  production,
  local,
}