import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
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
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.white,
          labelPadding: EdgeInsets.only(right: 15),
          isScrollable: true,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BubbleTabIndicator(
            indicatorHeight: 40,
            indicatorColor: Colors.blueGrey,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
//                      indicatorRadius: 1,
            insets: EdgeInsets.only(top: -1, left: 1, right: 16, bottom: 0),
//                        padding: EdgeInsets.symmetric(vertical: 30),
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
          Center(
            child: Text(
              'DLI',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
          ),
          Education(),
        ],
      ),
    );
  }
}
