import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import '../home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
  static const routeName = '/sign-up';
}

class _SignUpState extends State<SignUp> {
  String _name;
  String _email;
  String _password;
  String _confirmPassword;

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

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
        _name = value;
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
        }

//        if (value != _password) {
//          return 'Password\'s don\'t match';
//        }

        return null;
      },
      onSaved: (String value) {
        _confirmPassword = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
//            color: Colors.yellow,
//          decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage('images/papers_new.png'),
//              fit: BoxFit.fill,
//            ),
//          ),
          height: media.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
//                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage('images/coloured_logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
//              Padding(
//                padding:  EdgeInsets.only(left: 15.0, top: 20),
//                child: Container(
//                  child: IconButton(
//                    icon: Icon(
//                      Icons.arrow_back,
//                      color: Colors.black,
//                      size: 35.0,
//                    ),
//                    onPressed: () => Navigator.pop(context),
//                  ),
//                ),
//              ),
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
//                  height: 350.0,
                  height: media.height / 1.8,
//                color: Colors.yellow,
//                  margin: EdgeInsets.only(top: 50.0),
                  child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 25),
                      child: Form(
                        key: _formKey2,
                        child: Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      GradientButton(
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
                        callback: () {
                          if (!_formKey2.currentState.validate()) {
                            return;
                          }

                          _formKey2.currentState.save();

                          print(_name);
                          print(_email);
                          print(_password);
                          print(_confirmPassword);
                        },
                        gradient: Gradients.jShine,
                      ),
                    ],
                  ),
                ),
              ),
//              Spacer(),
              SizedBox(
                height: 20.0,
              ),
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
                            fontWeight: FontWeight.w600,
                            fontSize: 17.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
//                        Navigator.pushReplacementNamed(context, '/login');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
