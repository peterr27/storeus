import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_states.dart';
import 'package:storeus/features/posts/presentation/view/posts_view/widgets/success_widget.dart';

class GetPostsViewBody extends StatelessWidget {
  const GetPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, BaseState>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Storeus Posts'),
          centerTitle: true,
        ),
        body: _buildBody(state),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).push('/add-post', extra: context.read<PostBloc>());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildBody(BaseState state) {
    if (state is LoadingState) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Fetching posts...'),
          ],
        ),
      );
    } else if (state is ErrorState) {
      return Center(
        child: Text(state.message),
      );
    } else if (state is SuccessState) {
      return PostsSuccessWidget(posts: state.posts!);
    } else {
      return const SizedBox();
    }
  }
}
