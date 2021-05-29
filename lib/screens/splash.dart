import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = 'splash-screen';

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.indigo[300],
        width: double.infinity,
        height: media.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/budge_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: media.height / 1.8,
              child: Text(
                'Budge Food',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//body: Container(
//color: Colors.indigo[300],
//width: double.infinity,
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: [
//Container(
//height: 150,
//width: 150,
//decoration: BoxDecoration(
//image: DecorationImage(
//image: AssetImage('images/budge_logo.png'),
//fit: BoxFit.contain,
//)),
//),
//Text(
//'Budge Food',
//style: TextStyle(
//fontFamily: 'Pacifico',
//fontSize: 40,
//fontWeight: FontWeight.w900,
//color: Colors.white),
//),
//],
//),
//),
