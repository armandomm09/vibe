import 'package:flutter/material.dart';
import 'package:flutter_application_5/auths/firebase_post.dart';

class AppMessenger{


  static void showMessage(PostState state, var context) {
      final messenger = ScaffoldMessenger.of(context);
      final message = state == PostState.successful
          ? 'Data updated successfully!'
          : 'Failed to update data. Please try again.';
      final snackBar = SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: state == PostState.successful ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
      );
      messenger.showSnackBar(snackBar);
    }
  }