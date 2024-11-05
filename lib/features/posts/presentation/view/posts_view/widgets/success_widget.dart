import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/post_model.dart';
import '../../../bloc/posts_bloc.dart';
import '../../../bloc/posts_events.dart';
import 'delete_post_confirmation.dart';

class PostsSuccessWidget extends StatelessWidget {
  const PostsSuccessWidget({
    super.key,
    required this.posts,
  });

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: SearchBar(
                onChanged: (query) => BlocProvider.of<PostBloc>(context).add(SearchPostsEvent(query)),
                hintText: 'Search by name',
              )),
          const SizedBox(height: 10),
          Expanded(
            flex: 15,
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  if (posts.isEmpty) {
                    return const Center(
                      child: Text('No posts!'),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          decoration: const BoxDecoration(color: Colors.redAccent),
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        crossAxisEndOffset: .1,
                        key: Key(index.toString()),
                        confirmDismiss: (direction) async {
                          return await showDialog<bool>(
                            context: context,
                            builder: (context) => const DeletePostConfirmation(),
                          );
                        },
                        onDismissed: (direction) {
                          BlocProvider.of<PostBloc>(context).add(DeletePostEvent(post.id));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${post.text} deleted'),
                          ));
                        },
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.black45),
                          ),
                          onTap: () => GoRouter.of(context).push('/post/:postId', extra: post.id),
                          leading: Text(post.text),
                        ),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
