class Affiliates {
  final int id;
  final String position;
  final String link;
  final String title;
  final String imageUrl;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  Affiliates({
    required this.id,
    required this.position,
    required this.link,
    required this.title,
    required this.imageUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Affiliates.fromJson(Map<String, dynamic> json) {
    return Affiliates(
        id: json['id'],
        position: json['position'],
        link: json['link'],
        title: json['title'],
        imageUrl: json['image_url'],
        status: json['status'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']));
  }
}
