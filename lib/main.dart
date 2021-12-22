import 'package:flutter/material.dart';

import 'screens/category.dart';
import 'screens/category_meals.dart';
import 'screens/meal_detail.dart';
import 'screens/tabs.dart';
import 'screens/filters.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetail.routeName: (ctx) => const MealDetail(),
        FiltersScreen.routeName: (ctx) => const FiltersScreen(),
      },
    );
  }
}
