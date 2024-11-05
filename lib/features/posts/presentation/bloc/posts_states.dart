import 'package:storeus/features/posts/data/models/post_details_model.dart';

import '../../data/models/post_model.dart';

abstract class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class SuccessState extends BaseState {
  final List<PostModel>? posts;
  final PostDetailsModel? postDetails;
  final num? postId;
  SuccessState({this.posts, this.postId, this.postDetails});
}

class ErrorState extends BaseState {
  final String message;
  ErrorState(this.message);
}
