class PhotosModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PhotosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
