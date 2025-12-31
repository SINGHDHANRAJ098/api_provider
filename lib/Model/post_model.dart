class PostModel {
  final int userid;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.id,
    required this.userid,
    required this.title,
    required this.body,
  });

  factory PostModel.formJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userid: json['userid'],
      title: json['title'],
      body: json['body'],
    );
  }
}
