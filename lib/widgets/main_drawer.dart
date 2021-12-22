import 'package:flutter/material.dart';

import '../screens/filters.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  Widget buildListTile(BuildContext context, String title, IconData icon,
      VoidCallback onTapAction) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      onTap: onTapAction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: const Center(
              child: Text(
                'Panel!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            width: double.infinity,
            height: 150,
            color: Colors.amberAccent,
          ),
          buildListTile(context, 'Meals', Icons.restaurant_menu, () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile(context, 'Settings', Icons.settings, () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
