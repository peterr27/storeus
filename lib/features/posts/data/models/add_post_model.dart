//THIS CLASS MADE IN CASE THE FORM OF ADDING A POST REQUIRED MORE FIELDS
import 'dart:math';

class AddPostModel {
  num? id; // will not be included in api real post event
  String title;
  String details;
  String date;
  AddPostModel({required this.title, required this.date, required this.details}) {
    id = (10 + Random().nextInt(100)); //random id because im using dummy data
  }
  Map<String, dynamic> toJsonForDetails() => {
        'id': id,
        'title': title,
        'details': details,
        'date': date,
      };
  Map<String, dynamic> toJsonForPost() => {
        'id': id,
        'title': title,
      };
}
