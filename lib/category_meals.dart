import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category_meals';
  // final String categoryid;
  // final String categoryTittle;
  // CategoryMeals(this.categoryid, this.categoryTittle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTittle = routeArgs['tittle'];
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTittle),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 94, 96),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (ctx, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 200),
            child: Center(
              child: Text(
                "This Page For The Receipts of ${categoryTittle}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
