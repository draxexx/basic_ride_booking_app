import 'package:flutter/material.dart';

void showSuccessDialog({
  required BuildContext context,
  required Function() onSubmit,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: const Text("✅️ Success"),
        content: Text(message, textAlign: TextAlign.center),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              onSubmit();
            },
            child: const Text("Okay"),
          ),
        ],
      );
    },
  );
}
