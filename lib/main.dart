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
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

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
      routes: {
        '/': (context) => TapsWidget(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetails.routeName: (ctx) => MealDetails(),
        Filters.routeName: (ctx) => Filters(_filters, _saveFilters),
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: ((context) => Categories()));
      }),
    );
  }
}
