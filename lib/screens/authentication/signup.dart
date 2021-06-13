import 'package:budge_food/models/http_exception.dart';
import 'package:budge_food/provider/auth.dart';
import 'package:budge_food/widgets/authFailedDialog.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
  static const routeName = '/sign-up';
}

class _SignUpState extends State<SignUp> {
  var _isLoading = false;
  String name;
  String email;
  String password;
//  String _confirmPassword;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  Widget _buildName() {
    return TextFormField(
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        prefixIcon: Icon(
          Icons.person_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'FULL NAME',
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 17.0,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name required';
        }
        return null;
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        prefixIcon: Icon(
          Icons.mail_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'EMAIL',
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 17.0,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty || !value.contains('@')) {
          return 'Email required';
        }

        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: TextStyle(
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'PASSWORD',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
//        password = value;
        if (value.isEmpty) {
          return 'Password required';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
        fontSize: 17.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'CONFIRM PASSWORD',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password required';
        } else if (value != _passwordController.text) {
          return 'Password must be the same as above';
        } else {
          return null;
        }
      },
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    setState(() {
      _isLoading = true;
    });

    print(name);
    print(email);
    print(password);

    try {
      await Provider.of<Auth>(context, listen: false).signUp(email, password);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'Email address already in use';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'Password is too weak';
      }
      showAuthErrorDialog(context, errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenticate you. Please try again later';
      showAuthErrorDialog(context, errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: media.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/coloured_logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0, top: 10.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 37.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  height: media.height / 1.8,
                  child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 25),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            _buildName(),
                            Spacer(),
                            _buildEmail(),
                            Spacer(),
                            _buildPassword(),
                            Spacer(),
                            _buildConfirmPassword(),
                            Spacer(),
                          ],
                        ),
                      )),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.only(right: 40.0, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.orange,
                              ),
                            )
                          : GradientButton(
                              increaseHeightBy: 20,
                              increaseWidthBy: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Signup',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              callback: _submit,
                              gradient: Gradients.jShine,
                            ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: InkWell(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 13.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
