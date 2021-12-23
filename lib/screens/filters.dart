import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final saveFilter;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.saveFilter, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['Gluten'] as bool;
    _isLactoseFree = widget.currentFilters['Lactose'] as bool;
    _isVegan = widget.currentFilters['Vegan'] as bool;
    _isVegetarian = widget.currentFilters['Vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitch(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) setValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: setValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: BuildDrawer(),
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Manage your shop',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitch(
                'Gluten Free',
                'Only Gluten Free Meals.',
                _isGlutenFree,
                (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                },
              ),
              _buildSwitch(
                'Lactose Free',
                'Only Lactose Free Meals.',
                _isLactoseFree,
                (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                },
              ),
              _buildSwitch(
                'Vegans',
                'Only Vegan Meals.',
                _isVegan,
                (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                },
              ),
              _buildSwitch(
                'Vegetarian Foods',
                'Only Vegetarian Meals.',
                _isVegetarian,
                (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final _selectedFilter = {
            'Gluten': _isGlutenFree,
            'Lactose': _isLactoseFree,
            'Vegan': _isVegan,
            'Vegetarian': _isVegetarian,
          };
          widget.saveFilter(_selectedFilter);
        },
        child: const Icon(Icons.save_rounded),
      ),
    );
  }
}
