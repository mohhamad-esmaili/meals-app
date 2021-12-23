import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meals.dart';
import 'screens/category_meals.dart';
import 'screens/meal_detail.dart';
import 'screens/tabs.dart';
import 'screens/filters.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List<Meal> _availableMeal = dummy_meals;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeal = dummy_meals.where((meal) {
        if (_filters['Gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['Lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['Vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['Vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffF05454),
        accentColor: const Color(0xff30475E),
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
        fontFamily: "Roboto",
        appBarTheme: const AppBarTheme(
          color: Color(0xffF05454),
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            color: Color(0xffF5F5F5),
            fontFamily: 'Pacifico',
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 20.0,
            // fontWeight: FontWeight.bold,
            color: Color(0xff121212),
          ),
          headline1: TextStyle(
            fontSize: 20.0,
            // fontWeight: FontWeight.bold,
            color: Color(0xff121212),
          ),
        ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeal),
        MealDetail.routeName: (ctx) => const MealDetail(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
