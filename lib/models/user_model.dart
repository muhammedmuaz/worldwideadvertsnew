class UserModel {
  final int customerId;
  final String customerUid;
  final int groupId;
  final String firstName;
  final String lastName;
  final dynamic companyName;
  final dynamic companyNumber;
  final dynamic vatNumber;
  final dynamic customerType;
  final String email;
  final dynamic emailRecovery;
  final dynamic emailVerifiedAt;
  final dynamic authKey;
  final dynamic accessToken;
  final dynamic passwordResetKey;
  final dynamic phone;
  final dynamic gender;
  final dynamic birthday;
  final String avatar;
  final String source;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic addressCountry;
  final dynamic addressCity;
  final dynamic addressStreet;
  final dynamic addressHouse;
  final dynamic addressFlat;
  final dynamic currencyId;
  final String affiliateId;
  final int affiliatedMembers;
  final dynamic notificationSetting;
  final String ipAddress;
  final String ipLocation;
  final String ipLatlng;
  final String affiliateStatus;
  final dynamic website;
  final dynamic interest;
  final dynamic businessDescription;
  final dynamic owner;
  final dynamic currency;
  final dynamic location;

  UserModel({
    required this.customerId,
    required this.customerUid,
    required this.groupId,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.companyNumber,
    required this.vatNumber,
    required this.customerType,
    required this.email,
    required this.emailRecovery,
    required this.emailVerifiedAt,
    required this.authKey,
    required this.accessToken,
    required this.passwordResetKey,
    required this.phone,
    required this.gender,
    required this.birthday,
    required this.avatar,
    required this.source,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.addressCountry,
    required this.addressCity,
    required this.addressStreet,
    required this.addressHouse,
    required this.addressFlat,
    required this.currencyId,
    required this.affiliateId,
    required this.affiliatedMembers,
    required this.notificationSetting,
    required this.ipAddress,
    required this.ipLocation,
    required this.ipLatlng,
    required this.affiliateStatus,
    required this.website,
    required this.interest,
    required this.businessDescription,
    required this.owner,
    required this.currency,
    required this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        customerId: json["customer_id"],
        customerUid: json["customer_uid"],
        groupId: json["group_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        companyName: json["company_name"],
        companyNumber: json["company_number"],
        vatNumber: json["vat_number"],
        customerType: json["customer_type"],
        email: json["email"],
        emailRecovery: json["email_recovery"],
        emailVerifiedAt: json["email_verified_at"],
        authKey: json["auth_key"],
        accessToken: json["access_token"],
        passwordResetKey: json["password_reset_key"],
        phone: json["phone"],
        gender: json["gender"],
        birthday: json["birthday"],
        avatar: json["avatar"],
        source: json["source"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        addressCountry: json["address_country"],
        addressCity: json["address_city"],
        addressStreet: json["address_street"],
        addressHouse: json["address_house"],
        addressFlat: json["address_flat"],
        currencyId: json["currency_id"],
        affiliateId: json["affiliate_id"],
        affiliatedMembers: json["affiliated_members"],
        notificationSetting: json["notification_setting"],
        ipAddress: json["ip_address"],
        ipLocation: json["ip_location"],
        ipLatlng: json["ip_latlng"],
        affiliateStatus: json["affiliate_status"],
        website: json["website"],
        interest: json["interest"],
        businessDescription: json["business_description"],
        owner: json["owner"],
        currency: json["currency"],
        location: json["location"],
      );
}
