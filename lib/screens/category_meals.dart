import 'package:flutter/material.dart';
// import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

//Convert it to Stateful to handle the change of state and our items here in it after remove func
class CategoryMeals extends StatefulWidget {
  //static const property that will be used in route table to be sure that it refers to this class and this widget
  static const routeName = '/Categories-Meal';

  //Accept the available meals from the main
  final List<Meal> availableMeals;
  CategoryMeals(this.availableMeals);

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  //Defining Property to pass it to the initState
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadInitData = false;
//Calling initState To get all These data once the page loaded
  // @override
  // void initState() {
  // Done: implement initState
  //.... bad use because we have Modalroute.of(context) and there is no context when it's run
  // super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (_loadInitData == false) {
      // to access the arguments that passed in PushNamed arguments : id , title
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      // Get The Specific Data that match this meal thats from categories list in dummy_Data with the help of Category-ID
      //replace it with the availavleMeals List to handle the filters Data ..................
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  //Implement Remove Function
  void _removeMeal(String backMealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == backMealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 94, 96),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
