import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/post_details_model.dart';
import '../../../bloc/posts_bloc.dart';
import '../../../bloc/posts_states.dart';

class PostDetailsBody extends StatelessWidget {
  const PostDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessState) {
          final post = state.postDetails as PostDetailsModel;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    post.text,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  post.date,
                ),
                const SizedBox(height: 20),
                Text(
                  post.details,
                ),
              ],
            ),
          );
        } else if (state is ErrorState) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('No post found.'));
      },
    );
  }
}
