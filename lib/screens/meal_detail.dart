import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  //path fo this page
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    //get the id from the arguments
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("${mealId}"),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: Center(
        child: Text('The Meal!!!, Check ID ------------>>> ${mealId}'),
      ),
    );
  }
}
