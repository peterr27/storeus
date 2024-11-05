import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storeus/features/posts/data/models/add_post_model.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:storeus/features/posts/presentation/bloc/posts_events.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({required this.bloc, super.key});
  final PostBloc bloc;
  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter content';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    final post = AddPostModel(title: _titleController.text, details: _contentController.text, date: DateTime.now().toIso8601String());
                    widget.bloc.add(AddPostEvent(post));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Post added!'),
                    ));
                    GoRouter.of(context).pop();
                  }
                },
                child: const Text('Add Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
