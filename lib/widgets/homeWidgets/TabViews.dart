import 'package:flutter/material.dart';
import 'TabGrids/campus_home_grid.dart';
import 'TabGrids/dli_grid.dart';
import 'TabGrids/education_grid.dart';
import 'TabGrids/newhall_home_grid.dart';
import 'TabGrids/specials_home_grid.dart';

class Specials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: .85,
      crossAxisSpacing: 20,
      mainAxisSpacing: 35,
      children: [
        SpecialsHomeGrid('Burger', '1500', 'burger'),
        SpecialsHomeGrid('Pancakes', '500', 'pancakes'),
        SpecialsHomeGrid('Chelsea Buns', '300', 'chelsea buns'),
        SpecialsHomeGrid('Doughnut', '3000', 'doughnut'),
        SpecialsHomeGrid('Egg Rolls', '200', 'egg rolls'),
        SpecialsHomeGrid('Puff Puff', '300', 'puff puff'),
      ],
    );
  }
}

class Campus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CampusHomeGrid('Mavis Campus', ' Scaling up\nsatisfaction', 'mavis'),
        CampusHomeGrid('Calabar Kitchen',
            'Where there\'s coke,\n there\'s hospitality', '2001'),

        ///TODO CHANGE THIS IMAGE NAME (2001)
        CampusHomeGrid('Blessed', 'Where there\'s coke,\n there\'s hospitality',
            'blessed'),
        CampusHomeGrid(
            'Shop 10', 'Keeping it spicy \n    for a spice', 'shop10'),
      ],
    );
  }
}

class NewHall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NewHallHomeGrid('Mavis New Hall', ' Scaling up\nsatisfaction', 'mavis'),
        NewHallHomeGrid('2001 Cafeteria',
            'Where there\'s coke,\n there\'s hospitality', '2001'),
        NewHallHomeGrid('Unilag Bakery',
            'Freshly baked bread, \n baked to perfection', 'unilag_bakery'),
        NewHallHomeGrid('Korede Spaghetti',
            'Keeping it spicy \n    for a spice', 'korede_spaghetti'),
      ],
    );
  }
}

class Dli extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DliGrid('Iya Moria', 'Where there\'s coke,\n there\'s hospitality',
            'mavis'),
      ],
    );
  }
}

class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EducationGrid(
            'Olaiya', 'Where there\'s coke,\n there\'s hospitality', 'mavis'),
        EducationGrid('Olaiya (Swallow)',
            'Where there\'s coke,\n there\'s hospitality', 'olaiya'),
      ],
    );
  }
}

//gradient: LinearGradient(colors: [
//Color(0XFF416785),
//Color(0XFFFFFFFF),
//], begin: Alignment(-1, 0), end: Alignment(1, 1)),
