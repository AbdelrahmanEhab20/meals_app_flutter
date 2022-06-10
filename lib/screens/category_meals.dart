import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  //static const property that will be used in route table to be sure that it refers to this class and this widget
  static const routeName = '/Categories-Meal';

  // Constructor before Editing what we need from navigator properties
  /****************************** */
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMeals(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    // to access the arguments that passed in PushNamed arguments : id , title
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    // Get The Specific Data that match this meal thats from categories list in dummy_Data with the help of Category-ID
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 94, 96),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title);
        },
      ),
    );
  }
}
