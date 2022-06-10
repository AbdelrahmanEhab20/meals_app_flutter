import 'package:flutter/material.dart';
import '../screens/category_meals.dart';
import '../screens/meal_detail.dart';
import 'screens/categories.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.green,
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
        '/': (context) => Categories(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetails.routeName: (ctx) => MealDetails(),
      },
    );
  }
}
