import 'package:flutter/material.dart';
import 'package:mealsappp/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  //RouteName For this Page
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.saveFilters);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosFree = false;

//To Get the values when we load this page before build context
// and save them
  @override
  void initState() {
    _glutenFree = widget.currentFilters['glutenFree'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactosFree = widget.currentFilters['lactoseFree'];
    super.initState();
  }

  // Builder Method For All SwitchList Tile ---> all of filters
  Widget funcFilterSwitch(
      String title, String subtitle, bool currentValue, Function changeState) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: changeState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                final selcetedFilters = {
                  'glutenFree': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactoseFree': _lactosFree,
                };
                widget.saveFilters(selcetedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adjust your meal selection...',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            padding: EdgeInsets.all(20),
          ),
          //expand it's child to take all the available space
          Expanded(
              child: ListView(
            children: [
              //GlutenFree
              funcFilterSwitch(
                  "Gluten-Free", "Only GlutenFree Meals..", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              //vegetarian
              funcFilterSwitch(
                  "Vegetarian", "Only Vegetarian Meals..", _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              //Vegan
              funcFilterSwitch("Vegan", "Only Vegan Meals..", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              //lactose free
              funcFilterSwitch(
                  "Lactose-Free", "Only Lactose-Free Meals..", _lactosFree,
                  (newValue) {
                setState(() {
                  _lactosFree = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
