import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  final String categoryid;
  final String categoryTittle;
  CategoryMeals(this.categoryid, this.categoryTittle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTittle),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('The Receipts of this category'),
      ),
    );
  }
}
