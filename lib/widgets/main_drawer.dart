import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(
        String titleName, IconData iconData, Function tapHandler) {
      return ListTile(
        leading: Icon(iconData),
        title: Text(
          titleName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        onTap: () => tapHandler(),
      );
    }

    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text(
            "Cooking Up!",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        buildListTile("Meals", Icons.restaurant, () {
          // Navigator.of(context).popUntil((route) => route.isFirst);
          // Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed("/");
        }),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
        buildListTile("Filters", Icons.settings, () {
          Navigator.of(context).pushNamed(FilterScreen.routeName);
        }),
        const Divider(
          height: 5,
          color: Colors.grey,
        ),
      ],
    );
  }
}
