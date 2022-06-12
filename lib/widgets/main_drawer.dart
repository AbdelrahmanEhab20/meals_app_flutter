import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  //Making a builder Method For our ListTile Elements , we can make it as a widget instead of a builder method
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 110,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!!!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed('/filters');
          }),
        ],
      ),
    );
  }
}
