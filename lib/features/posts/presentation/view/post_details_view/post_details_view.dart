import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeus/features/posts/data/repo/dummy_data_impl.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:storeus/features/posts/presentation/view/post_details_view/widgets/post_details_body.dart';
import '../../bloc/posts_events.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({required this.postId, super.key});
  final num postId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(DummyPostsRepoImpl())..add(GetPostDetailsEvent(postId)),
      child: Scaffold(
        appBar: AppBar(),
        body: const PostDetailsBody(),
      ),
    );
  }
}
