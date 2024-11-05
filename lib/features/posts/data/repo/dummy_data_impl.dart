import 'package:dartz/dartz.dart';
import 'package:storeus/core/config/dummy_data.dart';
import 'package:storeus/core/utils/shared_models/error_model.dart';
import 'package:storeus/features/posts/data/models/add_post_model.dart';
import 'package:storeus/features/posts/data/models/post_details_model.dart';
import 'package:storeus/features/posts/data/models/post_model.dart';
import 'package:storeus/features/posts/domain/repo/posts_repo.dart';

class DummyPostsRepoImpl implements PostsRepo {
  @override
  Future<Either<ErrorModel, bool>> addPost({required AddPostModel postModel}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      posts.add(postModel.toJsonForPost());
      postsDetails.add(postModel.toJsonForDetails());
      return right(true);
    } catch (e) {
      return left(ErrorModel(message: 'Failed to add post'));
    }
  }

  @override
  Future<Either<ErrorModel, PostDetailsModel>> getPostDetails({required num postId}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final postDetails = postsDetails.firstWhere((post) => postId == postId);
      return right(PostDetailsModel.fromJson(postDetails));
    } catch (e) {
      return left(ErrorModel(message: 'Failed to load post details'));
    }
  }

  @override
  Future<Either<ErrorModel, List<PostModel>>> getPosts() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return right(posts.map((post) => PostModel.fromJson(post)).toList());
    } catch (e) {
      return left(ErrorModel(message: 'Failed to load posts'));
    }
  }

  @override
  Future<Either<ErrorModel, bool>> deletePost({required num postId}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      posts.removeWhere((post) => post['id'] == postId);
      postsDetails.removeWhere((post) => post['id'] == postId);
      return right(true);
    } catch (e) {
      return left(ErrorModel(message: 'Failed to load posts'));
    }
  }
}
