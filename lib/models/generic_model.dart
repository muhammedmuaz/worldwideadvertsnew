class GenericModel {
  String status = "";
  String message = "";

  GenericModel();

  GenericModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["message"] is int) {
      status = json["status"];
    }
  }
}
