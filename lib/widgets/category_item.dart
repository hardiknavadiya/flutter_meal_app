import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String name;
  final Color color;
  const CategoryItem(this.id, this.name, this.color, {super.key});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName, arguments: {
      'id': id,
      'name': name,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () => selectCategory(context),
        borderRadius: BorderRadius.circular(15),
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [color.withOpacity(0.3), color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
            )),
      ),
    );
  }
}
