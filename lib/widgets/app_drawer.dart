import 'package:flutter/material.dart';
import 'drawer_tiles.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 20),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.lightBlueAccent,
                          radius: 30,
                          backgroundImage: AssetImage('images/budge_logo.png'),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Budge Food',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blueGrey[700],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Hello Tolu...',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              Expanded(
                flex: 5,
                child: ListOfDrawerTiles(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
