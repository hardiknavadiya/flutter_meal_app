// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/bottom_navigationbar_tab_screen.dart';
import 'package:flutter_application_3/screens/category_meal_screen.dart';
import 'package:flutter_application_3/screens/filter_screen.dart';
import 'package:flutter_application_3/screens/meal_details_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.pink,
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber)),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      themeMode: ThemeMode.dark,
      // home: const BottomNavigationbarTabScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const BottomNavigationbarTabScreen(),
        CategoryMealScreen.routeName: (ctx) => const CategoryMealScreen(),
        MealDetailsScreen.routeName: (ctx) => const MealDetailsScreen(),
        FilterScreen.routeName: (ctx) => const FilterScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const BottomNavigationbarTabScreen(),
        );
      },
    );
  }
}
