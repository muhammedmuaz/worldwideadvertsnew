class AppImages {
  static const assetImagePath = 'assets/images/';
  static const iconsPath = 'assets/icons/';

  static String _concatPathAndImage(String icon, {String? path}) {
    return path == null ? assetImagePath + icon : path + icon;
  }

  // AppIcons
  static final appLogo =
      _concatPathAndImage("app_logo.png");
  static final imagePlaceHolderIcon =
      _concatPathAndImage("image_placeholder.svg");
  static final welcomeTopBar =
      _concatPathAndImage("welcome_topbar.png");    
  static final deafIcon =
      _concatPathAndImage("deaf_icon.svg");    
  static final listenerIcon =
      _concatPathAndImage("listener_icon.svg");
  static final emailIcon =
      _concatPathAndImage("email_icon.svg");
  static final facebookIcon =
      _concatPathAndImage("facebook_icon.svg");
  static final googleIcon =
      _concatPathAndImage("google_icon.svg");
  static final signupSuccessCircle =
      _concatPathAndImage("signup_success_top_circle.svg");    
  static final successfullThumbsUp =
      _concatPathAndImage("successfull_thumbsup.svg");
  static final screenBottomCircle =
      _concatPathAndImage("screen_bottom_circle.svg");
  static final notificationIcon =
      _concatPathAndImage("notification_icon.svg");
  

  // Home Boxes Icons 
  static final resourcesIcon =
      _concatPathAndImage("resources_icon.png");     
  static final emergencyIcon =
      _concatPathAndImage("emergency_icon.png"); 
  static final connectionsIcon =
      _concatPathAndImage("connections_icon.png"); 
  static final creasteDateIcon =
      _concatPathAndImage("create_data_icon.png");   
  static final activeListenerIcon =
      _concatPathAndImage("active_listener_icon.png");
  static final learnSignLanguageIcon =
      _concatPathAndImage("learn_sign_language_icon.png");    

  //Profile Image 

  static final earListenIcon =
      _concatPathAndImage("ear_listen_icon.svg");   
  static final profileIcon =
      _concatPathAndImage("profile_icon.svg");
  static final lockIcon =
      _concatPathAndImage("lock_icon.svg");    
  static final subscriptionIcon =
      _concatPathAndImage("subscription_icon.svg");
  static final cloudStorageIcon =
      _concatPathAndImage("cloud_storage_icon.svg");    
  static final securitySettingsIcon =
      _concatPathAndImage("security_settings_icon.svg");
  static final resourcesProfileIcon =
      _concatPathAndImage("resources_icon.svg");
  static final rateIcon =
      _concatPathAndImage("rate_icon.svg");
  static final logOutIcon =
      _concatPathAndImage("logout_icon.svg");  

  // Resources Section

  static final resourcesCover =
      _concatPathAndImage("resources_cover.png");

  static final govermentSourcesIcon =
      _concatPathAndImage("goverment_sources_icon.svg");
  static final upgradesIcon =
      _concatPathAndImage("upgrades_icon.svg");
  static final jobsIcon =
      _concatPathAndImage("jobs_icon.svg"); 

      // Goverment Sources

      static final govermentSources =
      _concatPathAndImage("goverment_sources_cover.png");

  static final bannerAdd =
      _concatPathAndImage("banner_add.png");
  static final classifiedAdd =
      _concatPathAndImage("banner_add2.png");
  static final affiliatesAdd =
      _concatPathAndImage("banneradd3.png");
  static final featuredAdds =
      _concatPathAndImage("featured_adds.png");
  static final promotedAdds =
      _concatPathAndImage("promoted_adds.jpg");
  static final bannerAdds =
      _concatPathAndImage("banner_adds.jpg");                        
      

// Temporary Images
static final tempLogo =
      _concatPathAndImage("temporary_logo.png");

                    
}
