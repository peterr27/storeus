import 'package:dartz/dartz.dart';
import 'package:storeus/features/posts/data/models/add_post_model.dart';
import '../../../../core/utils/shared_models/error_model.dart';
import '../../data/models/post_details_model.dart';
import '../../data/models/post_model.dart';

abstract class PostsRepo {
  Future<Either<ErrorModel, List<PostModel>>> getPosts();
  Future<Either<ErrorModel, bool>> deletePost({required num postId});
  Future<Either<ErrorModel, PostDetailsModel>> getPostDetails({required num postId});
  Future<Either<ErrorModel, bool>> addPost({required AddPostModel postModel});
}
