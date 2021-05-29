import 'package:budge_food/screens/SpecialsDetail.dart';
import 'package:budge_food/screens/authentication/login.dart';
import 'package:budge_food/screens/authentication/signup.dart';
import 'package:budge_food/screens/home.dart';
import 'package:budge_food/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/BasketScreen.dart';
import 'package:budge_food/provider/Basket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Basket(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          //Splash & Authentication Route
          SplashScreen.routeName: (context) => SplashScreen(),
          Login.routeName: (context) => Login(),
          SignUp.routeName: (context) => SignUp(),

          //Home Route
          HomeScreen.routeName: (context) => HomeScreen(),

          SpecialsDetailScreen.routeName: (context) => SpecialsDetailScreen(),

          BasketScreen.routeName: (context) => BasketScreen(),
        },
      ),
    );
  }
}
