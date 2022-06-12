import 'package:flutter/material.dart';
import '../screens/meal_detail.dart';
import 'package:mealsappp/models/meal.dart';

class MealItem extends StatelessWidget {
  // data and properties that will be entered to this widget
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //another property for handling deleting button when we back from details
  // final Function removeItem;
  //Constructor of This Class

  MealItem(
      {@required this.id,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.imageUrl,
      @required this.title});

  //Function or Getter To handle Complexity Values of Enum
  String get getValueComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Wrong Value or UnKnown';
    }
  }

//Function or Getter To handle Affordability Values of Enum
  String get getValueAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Wrong Value or UnKnown';
    }
  }

  //This method for tap at specific one of the meals and route to it's path and details
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetails.routeName, arguments: id);
    /***************************** */
    //Was Dealing with deleting items from the category Meals and when we return it appears again
    //   .then((valueID) {
    // if (valueID != null) {
    //   //This function will be implemented in other widget to delete with the id we pass to it from pop method
    //   // removeItem(valueID);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => selectMeal(context)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outline_sharp),
                      SizedBox(
                        width: 6,
                      ),
                      Text(getValueComplexity)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_sharp),
                      SizedBox(
                        width: 6,
                      ),
                      Text(getValueAffordability)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
