class Listing {
  final int listingId;
  final int packageId;
  final int customerId;
  final int locationId;
  final int categoryId;
  final int currencyId;
  final String title;
  final String slug;
  final String description;
  final dynamic businessTypes;
  final dynamic offer;
  final dynamic terms;
  final dynamic share;
  final int price;
  final String negotiable;
  final String hidePhone;
  final String hideEmail;
  final int remainingAutoRenewal;
  final String promoExpireAt;
  final dynamic listingExpireAt;
  final String status;
  final String createdAt;
  final String updatedAt;
  final dynamic capital;
  final String type;
  final dynamic eventDateStart;
  final dynamic eventDateEnd;
  final dynamic eventTimeStart;
  final dynamic eventTimeEnd;
  final dynamic listingType;
  final List<Image> images;
  final Package package;
  final Customer customer;
  final Location location;

  Listing({
    required this.listingId,
    required this.packageId,
    required this.customerId,
    required this.locationId,
    required this.categoryId,
    required this.currencyId,
    required this.title,
    required this.slug,
    required this.description,
    this.businessTypes,
    this.offer,
    this.terms,
    this.share,
    required this.price,
    required this.negotiable,
    required this.hidePhone,
    required this.hideEmail,
    required this.remainingAutoRenewal,
    required this.promoExpireAt,
    this.listingExpireAt,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.capital,
    required this.type,
    this.eventDateStart,
    this.eventDateEnd,
    this.eventTimeStart,
    this.eventTimeEnd,
    this.listingType,
    required this.images,
    required this.package,
    required this.customer,
    required this.location,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      listingId: json['listing_id'] ?? 0,
      packageId: json['package_id'] ?? 0,
      customerId: json['customer_id'] ?? 0,
      locationId: json['location_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      currencyId: json['currency_id'] ?? 0,
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      businessTypes: json['business_types'],
      offer: json['offer'],
      terms: json['terms'],
      share: json['share'],
      price: json['price'] ?? 0,
      negotiable: json['negotiable'] ?? '',
      hidePhone: json['hide_phone'] ?? '',
      hideEmail: json['hide_email'] ?? '',
      remainingAutoRenewal: json['remaining_auto_renewal'] ?? 0,
      promoExpireAt: json['promo_expire_at'] ?? '',
      listingExpireAt: json['listing_expire_at'],
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      capital: json['capital'],
      type: json['type'] ?? '',
      eventDateStart: json['event_date_start'],
      eventDateEnd: json['event_date_end'],
      eventTimeStart: json['event_time_start'],
      eventTimeEnd: json['event_time_end'],
      listingType: json['listing_type'],
      images: (json['images'] as List<dynamic>?)
              ?.map((i) => Image.fromJson(i as Map<String, dynamic>))
              .toList() ??
          [],
      package: Package.fromJson(json['package'] ?? {}),
      customer: Customer.fromJson(json['customer'] ?? {}),
      location: Location.fromJson(json['location'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'listing_id': listingId,
      'package_id': packageId,
      'customer_id': customerId,
      'location_id': locationId,
      'category_id': categoryId,
      'currency_id': currencyId,
      'title': title,
      'slug': slug,
      'description': description,
      'business_types': businessTypes,
      'offer': offer,
      'terms': terms,
      'share': share,
      'price': price,
      'negotiable': negotiable,
      'hide_phone': hidePhone,
      'hide_email': hideEmail,
      'remaining_auto_renewal': remainingAutoRenewal,
      'promo_expire_at': promoExpireAt,
      'listing_expire_at': listingExpireAt,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'capital': capital,
      'type': type,
      'event_date_start': eventDateStart,
      'event_date_end': eventDateEnd,
      'event_time_start': eventTimeStart,
      'event_time_end': eventTimeEnd,
      'listing_type': listingType,
      'images': images.map((i) => i.toJson()).toList(),
      'package': package.toJson(),
      'customer': customer.toJson(),
      'location': location.toJson(),
    };
  }
}

class Image {
  final int imageId;
  final int listingId;
  final String imagePath;
  final int sortOrder;
  final String createdAt;
  final String updatedAt;

  Image({
    required this.imageId,
    required this.listingId,
    required this.imagePath,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      imageId: json['image_id'] ?? 0,
      listingId: json['listing_id'] ?? 0,
      imagePath: json['image_path'] ?? '',
      sortOrder: json['sort_order'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_id': imageId,
      'listing_id': listingId,
      'image_path': imagePath,
      'sort_order': sortOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Package {
  final int packageId;
  final String title;
  final int price;
  final int listingDays;
  final int promoDays;
  final String promoShowPromotedArea;
  final String promoShowFeaturedArea;
  final String promoShowAtTop;
  final String promoSign;
  final String recommendedSign;
  final int autoRenewal;
  final int pictures;
  final String createdAt;
  final String updatedAt;

  Package({
    required this.packageId,
    required this.title,
    required this.price,
    required this.listingDays,
    required this.promoDays,
    required this.promoShowPromotedArea,
    required this.promoShowFeaturedArea,
    required this.promoShowAtTop,
    required this.promoSign,
    required this.recommendedSign,
    required this.autoRenewal,
    required this.pictures,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageId: json['package_id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      listingDays: json['listing_days'] ?? 0,
      promoDays: json['promo_days'] ?? 0,
      promoShowPromotedArea: json['promo_show_promoted_area'] ?? '',
      promoShowFeaturedArea: json['promo_show_featured_area'] ?? '',
      promoShowAtTop: json['promo_show_at_top'] ?? '',
      promoSign: json['promo_sign'] ?? '',
      recommendedSign: json['recommended_sign'] ?? '',
      autoRenewal: json['auto_renewal'] ?? 0,
      pictures: json['pictures'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'package_id': packageId,
      'title': title,
      'price': price,
      'listing_days': listingDays,
      'promo_days': promoDays,
      'promo_show_promoted_area': promoShowPromotedArea,
      'promo_show_featured_area': promoShowFeaturedArea,
      'promo_show_at_top': promoShowAtTop,
      'promo_sign': promoSign,
      'recommended_sign': recommendedSign,
      'auto_renewal': autoRenewal,
      'pictures': pictures,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Customer {
  final int customerId;
  final String customerUid;
  final int groupId;
  final String firstName;
  final String lastName;
  final String? companyName;
  final String? companyNumber;
  final String? vatNumber;
  final dynamic customerType;
  final String email;
  final String? emailRecovery;
  final dynamic emailVerifiedAt;
  final dynamic authKey;
  final dynamic accessToken;
  final String passwordResetKey;
  final String phone;
  final String gender;
  final dynamic birthday;
  final String avatar;
  final String source;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String? addressCountry;
  final String? addressCity;
  final String addressStreet;
  final String addressHouse;
  final String? addressFlat;
  final int currencyId;
  final String? affiliateId;
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
  final Currency currency;
  final Group? group;

  Customer({
    required this.customerId,
    required this.customerUid,
    required this.groupId,
    required this.firstName,
    required this.lastName,
    this.companyName,
    this.companyNumber,
    this.vatNumber,
    this.customerType,
    required this.email,
    this.emailRecovery,
    this.emailVerifiedAt,
    this.authKey,
    this.accessToken,
    required this.passwordResetKey,
    required this.phone,
    required this.gender,
    this.birthday,
    required this.avatar,
    required this.source,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.addressCountry,
    this.addressCity,
    required this.addressStreet,
    required this.addressHouse,
    this.addressFlat,
    required this.currencyId,
    this.affiliateId,
    required this.affiliatedMembers,
    this.notificationSetting,
    required this.ipAddress,
    required this.ipLocation,
    required this.ipLatlng,
    required this.affiliateStatus,
    this.website,
    this.interest,
    this.businessDescription,
    this.owner,
    required this.currency,
    required this.group,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['customer_id'] ?? 0,
      customerUid: json['customer_uid'] ?? '',
      groupId: json['group_id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      companyName: json['company_name'],
      companyNumber: json['company_number'],
      vatNumber: json['vat_number'],
      customerType: json['customer_type'],
      email: json['email'] ?? '',
      emailRecovery: json['email_recovery'],
      emailVerifiedAt: json['email_verified_at'],
      authKey: json['auth_key'],
      accessToken: json['access_token'],
      passwordResetKey: json['password_reset_key'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      birthday: json['birthday'],
      avatar: json['avatar'] ?? '',
      source: json['source'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      addressCountry: json['address_country'],
      addressCity: json['address_city'],
      addressStreet: json['address_street'] ?? '',
      addressHouse: json['address_house'] ?? '',
      addressFlat: json['address_flat'],
      currencyId: json['currency_id'] ?? 0,
      affiliateId: json['affiliate_id'],
      affiliatedMembers: json['affiliated_members'] ?? 0,
      notificationSetting: json['notification_setting'],
      ipAddress: json['ip_address'] ?? '',
      ipLocation: json['ip_location'] ?? '',
      ipLatlng: json['ip_latlng'] ?? '',
      affiliateStatus: json['affiliate_status'] ?? '',
      website: json['website'],
      interest: json['interest'],
      businessDescription: json['business_description'],
      owner: json['owner'],
      currency: Currency.fromJson(json['currency'] ?? {}),
      group: json['group'] != null ? Group.fromJson(json['group']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'customer_uid': customerUid,
      'group_id': groupId,
      'first_name': firstName,
      'last_name': lastName,
      'company_name': companyName,
      'company_number': companyNumber,
      'vat_number': vatNumber,
      'customer_type': customerType,
      'email': email,
      'email_recovery': emailRecovery,
      'email_verified_at': emailVerifiedAt,
      'auth_key': authKey,
      'access_token': accessToken,
      'password_reset_key': passwordResetKey,
      'phone': phone,
      'gender': gender,
      'birthday': birthday,
      'avatar': avatar,
      'source': source,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'address_country': addressCountry,
      'address_city': addressCity,
      'address_street': addressStreet,
      'address_house': addressHouse,
      'address_flat': addressFlat,
      'currency_id': currencyId,
      'affiliate_id': affiliateId,
      'affiliated_members': affiliatedMembers,
      'notification_setting': notificationSetting,
      'ip_address': ipAddress,
      'ip_location': ipLocation,
      'ip_latlng': ipLatlng,
      'affiliate_status': affiliateStatus,
      'website': website,
      'interest': interest,
      'business_description': businessDescription,
      'owner': owner,
      'currency': currency.toJson(),
      'group': group?.toJson(),
    };
  }
}

class Location {
  final int locationId;
  final int categoryId;
  final String name;
  final String slug;
  final int parentId;
  final String status;
  final int sortOrder;
  final String createdAt;
  final String updatedAt;

  Location({
    required this.locationId,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.parentId,
    required this.status,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      locationId: json['location_id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      parentId: json['parent_id'] ?? 0,
      status: json['status'] ?? '',
      sortOrder: json['sort_order'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location_id': locationId,
      'category_id': categoryId,
      'name': name,
      'slug': slug,
      'parent_id': parentId,
      'status': status,
      'sort_order': sortOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Currency {
  final int currencyId;
  final String code;
  final String name;
  final String symbol;

  Currency({
    required this.currencyId,
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      currencyId: json['currency_id'] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency_id': currencyId,
      'code': code,
      'name': name,
      'symbol': symbol,
    };
  }
}

class Group {
  final int groupId;
  final String title;
  final String discount;
  final String status;
  final String createdAt;
  final String updatedAt;

  Group({
    required this.groupId,
    required this.title,
    required this.discount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupId: json['group_id'] ?? 0,
      title: json['title'] ?? '',
      discount: json['discount'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'group_id': groupId,
      'title': title,
      'discount': discount,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
