import 'package:flutter/material.dart';

Future<dynamic> failedShowDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Oops'),
          content: Text('There is an error, please check again🤨'),
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
