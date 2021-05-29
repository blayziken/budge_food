import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';

  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
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
        if (value.isEmpty) {
          return 'Email required';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
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
        _password = value;
      },
    );
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
//          decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage('images/itl.cat_trippy-cartoon-wallpaper.png'),
//              fit: BoxFit.fill,
//            ),
//          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage('images/budge_logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
//                Spacer(),
                SizedBox(height: 20),
                Expanded(
//                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 35.0, left: 28.0),
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
                            EdgeInsets.only(top: 28.0, left: 28.0, right: 28.0),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0, top: 20),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 28.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GradientButton(
                              increaseHeightBy: 20,
                              increaseWidthBy: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                              callback: () {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                _formKey.currentState.save();

                                print(_email);
                                print(_password);
                              },
                              gradient: Gradients.jShine,
                            ),
                          ],
                        ),
                      ),
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
