import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/category_provider.dart';
import 'package:flutter_application_3/widgets/category_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(categoryProvider);
    return Scaffold(
        body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => SlideTransition(
                  position: Tween(
                          begin: const Offset(0, 0.3), end: const Offset(0, 0))
                      .animate(CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut)),
                  child: child,
                ),
            child: GridView(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                children: categoryList
                    .map((category) => CategoryItem(
                        category.id, category.title, category.color))
                    .toList())));
  }
}
