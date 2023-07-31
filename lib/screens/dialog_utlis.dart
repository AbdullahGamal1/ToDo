import 'package:flutter/material.dart';

class DialogUtlis {
  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 12,
              ),
              Text(message)
            ],
          ),
        );
      },
    );
  }

  static void showMessage(BuildContext context, String message,
      {String? postiveActionName,
      String? negtiveActionName,
      VoidCallback? postiveAction,
      VoidCallback? negtiveAction}) {
    List<Widget> action = [];
    if (postiveActionName != null) {
      action.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            postiveAction?.call();
          },
          child: Text(postiveActionName)));
    }
    if (negtiveActionName != null) {
      action.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negtiveAction?.call();
          },
          child: Text(negtiveActionName)));
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(content: Text(message), actions: action);
      },
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
