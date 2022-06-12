import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetails extends StatelessWidget {
  //path fo this page
  static const routeName = '/meal-detail';

  //get the favoutite toggle function from main
  final Function _toggleFavorites;
  //return true or false to toggle on icons
  final Function isFavoriteElement;

  MealDetails(this._toggleFavorites, this.isFavoriteElement);
  //Builder Method for Widget of Section Tittle
  Widget buildSelectedTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.subtitle1,
      ),
    );
  }

  //Another Builder Method for Container Widget used more than one time
  Widget buildContainer(Widget childWidget) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      width: 350,
      height: 250,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: childWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    //get the id from the arguments
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //Match The Id To Get Specific Meal
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectedTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Card(
                      color: Colors.amberAccent,
                      child: Text(
                        " - " + selectedMeal.ingredients[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
            buildSelectedTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('# ${index + 1}')),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      //Draw a horizontal Line (hr)
                      Divider()
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      //Demo For Know how to pop page
      //now it will be for toggle favorite
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.amber,
        backgroundColor: Colors.teal,
        child: Icon(
            isFavoriteElement(mealId) ? Icons.stars_sharp : Icons.star_border),
        onPressed: () => _toggleFavorites(mealId),
      ),
    );
  }
}
