import 'package:flutter/material.dart';

class Utils {
  static alert(BuildContext ctx, String title, String message, List<Widget> actions){
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: actions
        );
      }
    );
  }
}