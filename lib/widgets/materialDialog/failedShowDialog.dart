import 'package:flutter/material.dart';

Future<dynamic> failedShowDialog(context, {String text}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Oops'),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
