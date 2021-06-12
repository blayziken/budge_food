import 'package:flutter/material.dart';

void showAuthErrorDialog(context, String message) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('An Error Occurred!'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    ),
  );
}
