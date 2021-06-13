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
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            backgroundImage:
                                AssetImage('images/coloured_logo.png'),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Budge Food',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.blueGrey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Hello User..',
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
