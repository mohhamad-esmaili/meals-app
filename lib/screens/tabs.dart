import 'package:flutter/material.dart';

import './category.dart';
import './favorite.dart';
import '../models/meals.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'title': 'Category', 'page': const CategoryScreen()},
      {'title': 'Your Favorites', 'page': FavoriteScreen(widget.favoriteMeals)},
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const BuildDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontFamily: 'Pacifico'),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'Category',
              activeIcon: Icon(Icons.category)),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
            activeIcon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}
