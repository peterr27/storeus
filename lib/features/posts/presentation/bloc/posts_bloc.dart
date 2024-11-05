import 'package:bloc/bloc.dart';
import 'package:storeus/features/posts/data/models/post_model.dart';
import 'package:storeus/features/posts/domain/repo/posts_repo.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_events.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_states.dart';

class PostBloc extends Bloc<PostEvent, BaseState> {
  final PostsRepo postRepository;

  PostBloc(this.postRepository) : super(InitialState()) {
    on<GetPostsEvent>(_onGetPosts);
    on<DeletePostEvent>((event, emit) async {
      await _onDeletePost(event, emit);
      await _onGetPosts(GetPostsEvent(), emit);
    });
    on<AddPostEvent>((event, emit) async {
      await _onAddPost(event, emit);
      await _onGetPosts(GetPostsEvent(), emit);
    });
    on<GetPostDetailsEvent>(_onGetPostDetails);
    on<SearchPostsEvent>(_onSearchPosts);
  }
  List<PostModel> allPosts = [];

  Future<void> _onGetPosts(GetPostsEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await postRepository.getPosts();
    result.fold(
      (error) => emit(ErrorState(error.message)),
      (posts) {
        allPosts = posts;
        emit(SuccessState(posts: allPosts));
      },
    );
  }

  Future<void> _onAddPost(AddPostEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await postRepository.addPost(postModel: event.post);
    result.fold((error) => emit(ErrorState(error.message)), (_) async {
      await _onGetPosts(GetPostsEvent(), emit);
    });
  }

  Future<void> _onDeletePost(DeletePostEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await postRepository.deletePost(postId: event.postId);
    result.fold(
      (error) => emit(ErrorState(error.message)),
      (_) => emit(SuccessState()),
    );
  }

  Future<void> _onGetPostDetails(GetPostDetailsEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await postRepository.getPostDetails(postId: event.postId);
    result.fold(
      (error) => emit(ErrorState(error.message)),
      (post) => emit(SuccessState(postDetails: post)),
    );
  }

  Future<void> _onSearchPosts(SearchPostsEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    if (event.query.isEmpty) {
      emit(SuccessState(posts: allPosts));
      return;
    }
    final filteredPosts = allPosts.where((post) {
      return post.text.toLowerCase().contains(event.query.toLowerCase());
    }).toList();
    emit(SuccessState(posts: filteredPosts));
  }
}
