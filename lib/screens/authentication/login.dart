import 'package:budge_food/provider/auth.dart';
import 'package:budge_food/widgets/authFailedDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';
import 'package:budge_food/models/http_exception.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isLoading = false;
  String email;
  String password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
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
      obscureText: true,
      style: TextStyle(
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
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
        if (value.isEmpty) {
          return 'Password required';
        }

        return null;
      },
      onSaved: (String value) {
        password = value;
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

    print(email);
    print(password);

    try {
      await Provider.of<Auth>(context, listen: false).signIn(email, password);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Email address not found';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Password is wrong';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: media.height,
            width: media.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/coloured_logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
//                Spacer(),
                SizedBox(height: 0),
                Expanded(
//                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 25.0, left: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Please sign in to continue',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 28.0, right: 28.0),
                        child: Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                _buildEmail(),
                                SizedBox(
                                  height: 20,
                                ),
                                _buildPassword(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0, top: 20),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 28.0, top: 10),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Login',
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
                      Spacer(),
                    ],
                  ),
                ),
//                Spacer(),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 20,
                      child: InkWell(
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign up',
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
                          Navigator.pushReplacementNamed(context, '/sign-up');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
