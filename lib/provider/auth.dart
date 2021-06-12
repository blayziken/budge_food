import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate; //Expiry Date of the Token
  String _userId;

  //SIGN UP METHOD
  Future<void> signUp(String email, String password) async {
//    const url =
//        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDvpxpoUDSN3cyJPpi9tdR-cZkYUJQ--xI';
    const url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyDvpxpoUDSN3cyJPpi9tdR-cZkYUJQ--xI';

    final response = await http
        .post(
      Uri.parse(url),
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    )
        .catchError((err) {
      throw (err);
    });
    print(json.decode(response.body));
  }
}
