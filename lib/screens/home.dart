import 'package:budge_food/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:budge_food/widgets/custom_appBar.dart';
import 'package:budge_food/widgets/homeWidgets/home_tabBar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.97,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomAppBar(scaffoldKey: _scaffoldKey),
                  SizedBox(height: 30),
                  HomeTabBar(tabController: _tabController),
                  SizedBox(height: 30),
                  TabBarViewWidget(tabController: _tabController),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
