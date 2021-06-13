import 'package:flutter/material.dart';
import 'materialDialog/material_dialogs.dart';

Future<void> showAuthErrorDialog(context, String message) {
  return Dialogs.materialDialog(
    msg: message,
    title: "Error!",
    titleStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    msgStyle: TextStyle(fontSize: 16),
    color: Colors.white,
    context: context,
    actions: [
      TextButton(
        child: Text(
          'Ok',
          style: TextStyle(color: Colors.orange),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );
}
