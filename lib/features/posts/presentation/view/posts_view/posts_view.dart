import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:storeus/features/posts/data/repo/dummy_data_impl.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_events.dart';
import 'package:storeus/features/posts/presentation/view/posts_view/widgets/get_posts_view_body.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(DummyPostsRepoImpl())..add(GetPostsEvent()),
      child: const GetPostsViewBody(),
    );
  }
}
