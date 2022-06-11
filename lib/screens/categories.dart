import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../../data/dummy_data.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((catData) => property(catData.id, catData.title, catData.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}


//  Scaffold(
//       // appBar: AppBar(
//       //   title: Text("DeliMeal"),
//       //   centerTitle: true,
//       //   backgroundColor: Colors.teal[700],
//       // ),
//       body: 