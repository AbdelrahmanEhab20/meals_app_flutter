import 'package:flutter/material.dart';
import 'package:mealsappp/data/dummy_data.dart';
import 'package:mealsappp/models/meal.dart';
import '../screens/filters.dart';
import '../screens/category_meals.dart';
import '../screens/meal_detail.dart';
import './screens/categories.dart';
import './screens/taps_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => begriming();
}

class begriming extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };

  //to start Dealing with Filters and make them available
  List<Meal> _availableMeals = DUMMY_MEALS;
  //to start Dealing with favorite items in our app and
  // at the begaining is empty list
  List<Meal> favoriteMeals = [];

//Function For Handling the State of Filters
  void _saveFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

//Function For Handling the State of Favorites
  void _toggleFavorites(String mealId) {
    //indexWhere --> Check if This element of part of that list
    //and gives us it's index
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    // if existingIndex = number greater than 0
    // then it's exist if -1 then add it to this list
    if (existingIndex >= 0) {
      setState(() {
        //it's exist so delete when we click btn again
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        //first meal will be found will be added to favorite list
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

// For Check If this item with that id in favorite list of not to mark it
  bool isFavoriteMeal(String id) {
    //run on each element with any()
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Color.fromARGB(255, 84, 83, 83),
        canvasColor: Color.fromARGB(255, 229, 255, 238),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            subtitle2: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home:Categories() ,
      initialRoute: '/',
      routes: {
        '/': (context) => TapsWidget(favoriteMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetails.routeName: (ctx) =>
            MealDetails(_toggleFavorites, isFavoriteMeal),
        Filters.routeName: (ctx) => Filters(_filters, _saveFilters),
      },
      // onGenerateRoute: ,
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: ((context) => Categories()));
      }),
    );
  }
}
