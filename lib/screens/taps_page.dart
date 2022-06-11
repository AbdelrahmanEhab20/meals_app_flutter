import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories.dart';
import '../screens/favorites.dart';

class TapsWidget extends StatefulWidget {
  @override
  State<TapsWidget> createState() => _TapsWidgetState();
}

class _TapsWidgetState extends State<TapsWidget> {
  //List OF Screen Widgets We need To Give To The Taps

  //we can edit this list to be a small map and give keys value as page and title key for each page ,
  //so when we tap on specific tap it will pass the title of this screen
  final List<Map<String, Object>> _pages = [
    {"page": Categories(), 'title': 'Categories'},
    {"page": Favorites(), 'title': 'Favorites'}
  ];
  int _selectedIndexPage = 0;

  void _pageSelected(int index) {
    setState(() {
      _selectedIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndexPage]['title']),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      //select page from the map
      body: _pages[_selectedIndexPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _pageSelected,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndexPage,
        type: BottomNavigationBarType.shifting,
        //Default Is Fixed Type instead of Shifting
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}

//Bottom of Bar Widget For handling Taps
//  DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Meals'),
//             bottom: TabBar(tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Category',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               )
//             ]),
//           ),
//           body: TabBarView(children: [
//             Categories(),
//             Favorites(),
//           ]),
//         ));
