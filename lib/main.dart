import 'package:budge_food/provider/Orders.dart';
import 'package:budge_food/provider/auth.dart';
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
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => Basket(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (context, auth, previousOrders) => Orders(
            auth.token,
            auth.userId,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          title: 'Budge Food',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: auth.isAuth // Are we authenticated ?
              ? HomeScreen() // If yes, show the Home Screen
              : FutureBuilder(
                  //If not, run Future Builder
                  future: auth.tryAutoLogin(), //Try AutoLogin
                  builder: (context, authResultSnapshot) => authResultSnapshot
                              .connectionState ==
                          ConnectionState.waiting
                      ? SplashScreen() //Whilst we're waiting for a result, show the Splash Screen
                      : Login(), //If we're done waiting, show the Login Screen
                ),
          routes: {
            //Splash & Authentication Routes
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
      ),
    );
  }
}
