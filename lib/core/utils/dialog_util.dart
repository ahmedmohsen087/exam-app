import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, {String message = "Loading..."}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void showMessage(
      BuildContext context, {
        required String message,
        String title = "Message",
      }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          content: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}