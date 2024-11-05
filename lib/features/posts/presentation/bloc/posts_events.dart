import 'package:storeus/features/posts/data/models/add_post_model.dart';

abstract class PostEvent {}

class GetPostsEvent extends PostEvent {}

class AddPostEvent extends PostEvent {
  final AddPostModel post;
  AddPostEvent(this.post);
}

class DeletePostEvent extends PostEvent {
  final num postId;
  DeletePostEvent(this.postId);
}

class GetPostDetailsEvent extends PostEvent {
  final num postId;
  GetPostDetailsEvent(this.postId);
}

class SearchPostsEvent extends PostEvent {
  final String query;
  SearchPostsEvent(this.query);
}
