import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  Widget buildListTile(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      onTap: () {},
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
          buildListTile(context, 'Meals', Icons.restaurant_menu),
          buildListTile(context, 'Settings', Icons.settings)
        ],
      ),
    );
  }
}
