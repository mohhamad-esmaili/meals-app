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
  List<Meal> _favoriteMeals = [];

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

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(dummy_meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
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
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeal),
        MealDetail.routeName: (ctx) =>
            MealDetail(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
