import 'package:go_router/go_router.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:storeus/features/posts/presentation/view/add_post/add_post_view.dart';
import 'package:storeus/features/posts/presentation/view/post_details_view/post_details_view.dart';
import '../../../features/posts/presentation/view/posts_view/posts_view.dart';

//TODO : WE CAN ADD PATHS AS STATIC STRINGS SO I CAN REFER TO IT IN UI :)
class AppRouterConfig {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PostsView(),
      ),
      GoRoute(
        path: '/post/:postId',
        builder: (context, state) {
          final postId = state.extra as num;
          return PostDetailsView(postId: postId);
        },
      ),
      GoRoute(
        path: '/add-post',
        builder: (context, state) => AddPostView(bloc: state.extra as PostBloc),
      ),
    ],
  );
}
