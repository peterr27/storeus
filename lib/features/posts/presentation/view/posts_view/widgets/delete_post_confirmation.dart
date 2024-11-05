import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeletePostConfirmation extends StatelessWidget {
  const DeletePostConfirmation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete post!'),
      content: const Text('Are you sure you want to delete this post?'),
      actions: [
        TextButton(
          onPressed: () => GoRouter.of(context).pop(true),
          child: const Text('Delete'),
        ),
        TextButton(
          onPressed: () => GoRouter.of(context).pop(false),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
