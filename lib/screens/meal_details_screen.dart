import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/meal.dart';
import 'package:flutter_application_3/provider/favourite_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  static const routeName = '/meal-detail';

  const MealDetailsScreen({super.key});

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  Widget headingText(context, text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    Meal meal = routeArgs["meal"] as Meal;
    List<Meal> favouriteMeals = ref.watch(favouriteMealProvider);
    bool isFavouriteInd = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          meal.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Hero(
                tag: meal.id,
                child: Image.network(
                  "https://cdn01.cimediacloud.com/cifiles/82e0f22812e74e48928d4d260d19266c/renditions/thumbnail.jpg?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiKjovL2NkbjAxLmNpbWVkaWFjbG91ZC5jb20vY2lmaWxlcy84MmUwZjIyODEyZTc0ZTQ4OTI4ZDRkMjYwZDE5MjY2Yy9yZW5kaXRpb25zL3RodW1ibmFpbC5qcGciLCJDb25kaXRpb24iOnsiSXBBZGRyZXNzIjp7IkFXUzpTb3VyY2VJcCI6IjAuMC4wLjAvMCJ9LCJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MjE0NTgzMDQwMH19fV19&Signature=FjbMqkY~uwMWYnDl6xTTkER-jJIIwgz9m17~6abPUlPHGl97sG6n87IGfBhkbcJ2pwHP0rgGd9XIAbMTn72Z-x3xqXQpM8k9GGzkkpv2IDd9j9CMHEs7v9CnHbQqpSPWk57qQxRv6GR9SMZZ8XTA7yqD6IW9sptlYsiQGYM0JS4_&Key-Pair-Id=APKAJNUSFH4IKQRZ44WA",
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            headingText(context, "Ingedients"),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor,
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 200,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amberAccent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Text(
                            meal.ingredients[index],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: meal.ingredients.length),
            ),
            headingText(context, "Steps"),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: Colors.green)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 300,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Text("# ${index + 1}")),
                      title: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amberAccent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: Text(
                            meal.steps[index],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: meal.steps.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () =>
            ref.watch(favouriteMealProvider.notifier).toggleFavourites(meal),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Icon(
            isFavouriteInd ? Icons.favorite : Icons.favorite_border,
            key: ValueKey(isFavouriteInd),
          ),
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: animation,
              // turns: Tween(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
