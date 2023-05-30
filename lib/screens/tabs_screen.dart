import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              "Food Adda",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favouries",
              )
            ]),
          ),
          body: const TabBarView(children: [
            // CategoryScreen(displayMeals),
            // FavouritesScreen()
          ]),
        ));
  }
}
