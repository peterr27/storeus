class PostModel {
  num id;
  String text;
  PostModel({required this.id, required this.text});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(id: json['id'], text: json['title']);
}
