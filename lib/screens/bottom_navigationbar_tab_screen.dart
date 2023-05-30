import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/category_screen.dart';
import 'package:flutter_application_3/screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';

class BottomNavigationbarTabScreen extends StatefulWidget {
  const BottomNavigationbarTabScreen({super.key});

  @override
  State<BottomNavigationbarTabScreen> createState() =>
      _BottomNavigationbarTabScreenState();
}

class _BottomNavigationbarTabScreenState
    extends State<BottomNavigationbarTabScreen> {
  late List<Map<String, Object>> pages;
  int _selectedIndex = 0;
  void _selectedPage(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {"title": "Categories", "page": const CategoryScreen()},
      {"title": "Favourites", "page": const FavouritesScreen()},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          pages[_selectedIndex]["title"].toString(),
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: "Favourites")
        ],
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.greenAccent,
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: pages[_selectedIndex]["page"] as Widget,
    );
  }
}
