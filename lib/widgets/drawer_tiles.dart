import 'package:budge_food/screens/ProcessedOrders.dart';
import 'package:flutter/material.dart';

class ListOfDrawerTiles extends StatelessWidget {
  const ListOfDrawerTiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerListTile(
          title: "Orders",
          color: Colors.blueGrey,
          icon: Icons.content_copy,
          onTap: () {
            print('Orders Screen');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProcessedOrders(),
              ),
            );
          },
        ),
        DrawerListTile(
          title: "Payment",
          color: Colors.blueGrey,
          icon: Icons.payment,
          onTap: () {
            print('Payment');
          },
        ),
        DrawerListTile(
          title: "Profile",
          color: Colors.blueGrey,
          icon: Icons.person,
          onTap: () {
            print('Profile');
          },
        ),
        DrawerListTile(
          title: "About",
          color: Colors.blueGrey,
          icon: Icons.help_outline,
          onTap: () {
            print('About');
          },
        ),
        DrawerListTile(
          title: "Contact Us",
          color: Colors.blueGrey,
          icon: Icons.contact_phone,
          onTap: () {
            print('Contact Us');
          },
        ),
        Divider(),
        Divider(),
        DrawerListTile(
          title: "Sign Out",
          color: Colors.red,
          icon: Icons.logout,
          onTap: () {
            print('Sign Out');
          },
        ),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final Function onTap;

  DrawerListTile({this.icon, this.color, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.blueGrey[800]),
      ),
      onTap: onTap,
    );
  }
}
