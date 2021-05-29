import 'package:flutter/material.dart';

import 'homeWidgets/homeSearch_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Icon(Icons.list, size: 40),
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            SizedBox(width: 5),
            HomeSearchWidget(),
            SizedBox(width: 5),
            Icon(Icons.shopping_cart, size: 40),
          ],
        ),
      ),
    );
  }
}
