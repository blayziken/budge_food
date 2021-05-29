import 'package:flutter/material.dart';
import 'TabGrids/campus_home_grid.dart';
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
        SpecialsHomeGrid('Burger', '1500'),
        SpecialsHomeGrid('Pancakes', '500'),
        SpecialsHomeGrid('Chelsea Buns', '300'),
        SpecialsHomeGrid('Doughnut', '3000'),
        SpecialsHomeGrid('Egg Rolls', '200'),
        SpecialsHomeGrid('Puff Puff', '300'),
      ],
    );
  }
}

class Campus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CampusHomeGrid('Mavis Campus', ' Scaling up\nsatisfaction'),
        CampusHomeGrid(
            'Calabar Kitchen', 'Where there\'s coke,\n there\'s hospitality'),
        CampusHomeGrid(
            'Blessed', 'Where there\'s coke,\n there\'s hospitality'),
        CampusHomeGrid('Shop 10', 'Keeping it spicy \n    for a spice'),
      ],
    );
  }
}

class NewHall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NewHallHomeGrid('Mavis New Hall', ' Scaling up\nsatisfaction'),
        NewHallHomeGrid(
            '2001 Cafeteria', 'Where there\'s coke,\n there\'s hospitality'),
        NewHallHomeGrid(
            'Unilag Bakery', 'Freshly baked bread, \n baked to perfection'),
        NewHallHomeGrid(
            'Korede Spaghetti', 'Keeping it spicy \n    for a spice'),
      ],
    );
  }
}

class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EducationGrid('Olaiya', ' Scaling up\nsatisfaction'),
        EducationGrid(
            'Olaiya (Swallow)', 'Where there\'s coke,\n there\'s hospitality'),
      ],
    );
  }
}
