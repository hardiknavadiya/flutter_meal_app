import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/meal.dart';
import 'package:flutter_application_3/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  // final Function removeMeal;
  const MealItem(this.meal, {super.key});

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.pricey:
        return "Pricey";
      case Affordability.luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  void selectMeal(context, meal) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName,
        arguments: {"meal": meal}).then((value) {
      if (value != null) {
        // removeMeal(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context, meal),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: meal.id,
                  child: Image.network(
                    "https://cdn01.cimediacloud.com/cifiles/82e0f22812e74e48928d4d260d19266c/renditions/thumbnail.jpg?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiKjovL2NkbjAxLmNpbWVkaWFjbG91ZC5jb20vY2lmaWxlcy84MmUwZjIyODEyZTc0ZTQ4OTI4ZDRkMjYwZDE5MjY2Yy9yZW5kaXRpb25zL3RodW1ibmFpbC5qcGciLCJDb25kaXRpb24iOnsiSXBBZGRyZXNzIjp7IkFXUzpTb3VyY2VJcCI6IjAuMC4wLjAvMCJ9LCJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MjE0NTgzMDQwMH19fV19&Signature=FjbMqkY~uwMWYnDl6xTTkER-jJIIwgz9m17~6abPUlPHGl97sG6n87IGfBhkbcJ2pwHP0rgGd9XIAbMTn72Z-x3xqXQpM8k9GGzkkpv2IDd9j9CMHEs7v9CnHbQqpSPWk57qQxRv6GR9SMZZ8XTA7yqD6IW9sptlYsiQGYM0JS4_&Key-Pair-Id=APKAJNUSFH4IKQRZ44WA",
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(meal.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white),
                      overflow: TextOverflow.fade,
                      softWrap: true),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(meal.duration.toString())
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText)
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
