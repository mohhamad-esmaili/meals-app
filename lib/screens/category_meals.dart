import 'package:flutter/material.dart';
import 'package:shop/models/meals.dart';

import '../dummy_data.dart';
import '../widgets/meal_items.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeal;
  var _isLoaded = false;
  @override
  void didChangeDependencies() {
    if (!_isLoaded) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final String? categoryID = routeArgs['id'];
      displayedMeal = dummy_meals.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
      _isLoaded = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(mealId) {
    setState(() {
      displayedMeal?.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: displayedMeal?.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal![index].id,
            affordability: displayedMeal![index].affordability,
            complexity: displayedMeal![index].complexity,
            duration: displayedMeal![index].duration,
            imageUrl: displayedMeal![index].imageUrl,
            title: displayedMeal![index].title,
            removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
