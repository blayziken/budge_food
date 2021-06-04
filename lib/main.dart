import 'package:budge_food/screens/SpecialsDetail.dart';
import 'package:budge_food/screens/authentication/login.dart';
import 'package:budge_food/screens/authentication/signup.dart';
import 'package:budge_food/screens/campus_newHall_education_dli_order/campus_order.dart';
import 'package:budge_food/screens/campus_newHall_education_dli_order/order_details.dart';
import 'package:budge_food/screens/home.dart';
import 'package:budge_food/screens/splashs/introduction.dart';
import 'package:budge_food/screens/splashs/splash.dart';
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
        title: 'Budge Food',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          //Splash & Authentication Route
          SplashScreen.routeName: (context) => SplashScreen(),
          IntroductionSlide.routeName: (context) => IntroductionSlide(),
          Login.routeName: (context) => Login(),
          SignUp.routeName: (context) => SignUp(),

          //Home Route
          HomeScreen.routeName: (context) => HomeScreen(),

          SpecialsDetailScreen.routeName: (context) => SpecialsDetailScreen(),

          //Campus, New Hall, DLI, Education Order Screens
          CampusOrderScreen.routeName: (context) => CampusOrderScreen(),

          //Basket Screen
          BasketScreen.routeName: (context) => BasketScreen(),

          FoodOrderDetails.routeName: (context) => FoodOrderDetails(),
        },
      ),
    );
  }
}
