import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/filter_provider.dart';
import 'package:flutter_application_3/widgets/main_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  static const routeName = '/filters';
  const FilterScreen({super.key});

  Widget filterSwitch(currentValue, titleValue, subtitlevalue, onChangeValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: onChangeValue,
      title: Text(titleValue),
      subtitle: Text(subtitlevalue),
    );
  }

  // onChnageUpdateMeals() {
  //   Map<String, bool> selectedFilterValue = {
  //     "GlutenFree": glutenFree,
  //     "Vegan": vegan,
  //     "Vegetarian": vegetarian,
  //     "LactoseFree": lactoseFree
  //   };
  //   // ignore: avoid_print
  //   print(selectedFilterValue);
  //   widget.toggleFilterValue(selectedFilterValue);
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, bool> filterValue = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Your Filters",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
      drawer: const Drawer(child: MainDrawer()),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(children: [
          Text(
            "Adjust your meal selection.",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 10),
              children: [
                filterSwitch(
                  filterValue["GlutenFree"],
                  "Gluten Free",
                  "Only add Gluten Free meals",
                  (val) {
                    ref
                        .watch(filterProvider.notifier)
                        .setFilter("GlutenFree", val);
                  },
                ),
                filterSwitch(
                  filterValue["Vegan"],
                  "Vegan",
                  "Only add Vegan meals",
                  (val) {
                    ref.watch(filterProvider.notifier).setFilter("Vegan", val);
                  },
                ),
                filterSwitch(
                  filterValue["Vegetarian"],
                  "Vegetarian",
                  "Only add Vegetarian meals",
                  (val) {
                    ref
                        .watch(filterProvider.notifier)
                        .setFilter("Vegetarian", val);
                  },
                ),
                filterSwitch(
                  filterValue["LactoseFree"],
                  "Lactose Free",
                  "Only add Lactose Free meals",
                  (val) {
                    ref
                        .watch(filterProvider.notifier)
                        .setFilter("LactoseFree", val);
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
