import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budge_food/widgets/homeWidgets/HomeTabs.dart';

import 'TabViews.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: TabBar(
          unselectedLabelColor: Color(0xFF416785),
          labelColor: Colors.white,
          labelPadding: EdgeInsets.only(right: 15),
          isScrollable: true,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding:
              EdgeInsets.only(top: 1, left: 2.2, right: 20, bottom: 3),

          indicator: ShapeDecoration(
            color: Color(0xFF416785),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          tabs: <Widget>[
            HomeTabs('Specials'),
            HomeTabs('Campus'),
            HomeTabs('New Hall'),
            HomeTabs('DLI'),
            HomeTabs('Education'),
          ],
        ),
      ),
    );
  }
}

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 13,
      child: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Specials(),
          Campus(),
          NewHall(),
          Dli(),
          Education(),
        ],
      ),
    );
  }
}
