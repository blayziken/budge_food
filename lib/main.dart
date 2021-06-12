import 'package:budge_food/provider/Orders.dart';
import 'package:budge_food/screens/SpecialsDetail.dart';
import 'package:budge_food/screens/authentication/login.dart';
import 'package:budge_food/screens/authentication/signup.dart';
import 'package:budge_food/screens/campus_newHall_education_dli_order/food_order.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Basket(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Budge Food',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUp(),
        routes: {
          //Splash & Authentication Route
          SplashScreen.routeName: (context) => SplashScreen(),
          IntroductionSlide.routeName: (context) => IntroductionSlide(),
          Login.routeName: (context) => Login(),
          SignUp.routeName: (context) => SignUp(),

          //Home Route
          HomeScreen.routeName: (context) => HomeScreen(),

          //Campus, New Hall, DLI, Education Order Screens
          FoodOrderScreen.routeName: (context) => FoodOrderScreen(),

          //Basket Screen
          BasketScreen.routeName: (context) => BasketScreen(),

          //Specials and Food Details Screen
          SpecialsDetailScreen.routeName: (context) => SpecialsDetailScreen(),
          FoodOrderDetails.routeName: (context) => FoodOrderDetails(),
        },
      ),
    );
  }
}
