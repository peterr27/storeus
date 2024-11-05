class PostDetailsModel {
  num id;
  String text;
  String details;
  String date;
  PostDetailsModel({required this.id, required this.text, required this.details, required this.date});

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) =>
      PostDetailsModel(id: json['id'], text: json['title'], details: json['details'], date: json['date']);
}
