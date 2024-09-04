import 'generic_model.dart';

class UserMainModel extends GenericModel {
  UserModel data = UserModel();

  UserMainModel();

  UserMainModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['data'] is Map) {
      data = UserModel.fromJson(json['data']);
    }
  }
}

class UserModel {
  int customerId = 0;
  String customerUid = '';
  int groupId = 0;
  String firstName = '';
  String lastName = '';
  dynamic companyName;
  dynamic companyNumber;
  dynamic vatNumber;
  dynamic customerType;
  String email = '';
  dynamic emailRecovery;
  dynamic emailVerifiedAt;
  dynamic authKey;
  dynamic accessToken;
  dynamic passwordResetKey;
  dynamic phone;
  dynamic gender;
  dynamic birthday;
  String avatar = '';
  String source = '';
  String status = '';
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  dynamic addressCountry;
  dynamic addressCity;
  dynamic addressStreet;
  dynamic addressHouse;
  dynamic addressFlat;
  dynamic currencyId;
  String affiliateId = '';
  int affiliatedMembers = 0;
  dynamic notificationSetting;
  String ipAddress = '';
  String ipLocation = '';
  String ipLatlng = '';
  String affiliateStatus = '';
  dynamic website;
  dynamic interest;
  dynamic businessDescription;
  dynamic owner;
  dynamic currency;
  dynamic location;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['customer_id'] is int) {
      customerId = json['customer_id'];
    }
    if (json['customer_uid'] is String) {
      customerUid = json['customer_uid'];
    }
    if (json['group_id'] is int) {
      groupId = json['group_id'];
    }
    if (json['first_name'] is String) {
      firstName = json['first_name'];
    }
    if (json['last_name'] is String) {
      lastName = json['last_name'];
    }
    companyName = json['company_name'];
    companyNumber = json['company_number'];
    vatNumber = json['vat_number'];
    customerType = json['customer_type'];
    if (json['email'] is String) {
      email = json['email'];
    }
    emailRecovery = json['email_recovery'];
    emailVerifiedAt = json['email_verified_at'];
    authKey = json['auth_key'];
    accessToken = json['access_token'];
    passwordResetKey = json['password_reset_key'];
    phone = json['phone'];
    gender = json['gender'];
    birthday = json['birthday'];
    if (json['avatar'] is String) {
      avatar = json['avatar'];
    }
    if (json['source'] is String) {
      source = json['source'];
    }
    if (json['status'] is String) {
      status = json['status'];
    }
    if (json['created_at'] is String) {
      createdAt = DateTime.tryParse(json['created_at']) ?? DateTime.now();
    }
    if (json['updated_at'] is String) {
      updatedAt = DateTime.tryParse(json['updated_at']) ?? DateTime.now();
    }
    addressCountry = json['address_country'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressHouse = json['address_house'];
    addressFlat = json['address_flat'];
    currencyId = json['currency_id'];
    if (json['affiliate_id'] is String) {
      affiliateId = json['affiliate_id'];
    }
    if (json['affiliated_members'] is int) {
      affiliatedMembers = json['affiliated_members'];
    }
    notificationSetting = json['notification_setting'];
    if (json['ip_address'] is String) {
      ipAddress = json['ip_address'];
    }
    if (json['ip_location'] is String) {
      ipLocation = json['ip_location'];
    }
    if (json['ip_latlng'] is String) {
      ipLatlng = json['ip_latlng'];
    }
    if (json['affiliate_status'] is String) {
      affiliateStatus = json['affiliate_status'];
    }
    website = json['website'];
    interest = json['interest'];
    businessDescription = json['business_description'];
    owner = json['owner'];
    currency = json['currency'];
    location = json['location'];
  }
}
