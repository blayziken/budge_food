import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate; //Expiry Date of the Token
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDvpxpoUDSN3cyJPpi9tdR-cZkYUJQ--xI';

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

  //SIGN UP METHOD
  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  //SIGN IN METHOD
  Future<void> signIn(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
