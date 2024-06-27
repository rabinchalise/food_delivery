import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/providers/resturant_provider.dart';
import 'package:food_delivery/screens/food_details_screen.dart';
import 'package:food_delivery/widgets/current_location.dart';
import 'package:food_delivery/widgets/custom_sliver_appbar.dart';
import 'package:food_delivery/widgets/custom_tab_bar.dart';
import 'package:food_delivery/widgets/description_box.dart';
import 'package:food_delivery/widgets/food_tile.dart';

import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuCatgeory(FoodCategory category, List<Food> menu) {
    return menu.where((food) => food.category == category).toList();
  }

  List<Widget> _getFoodInThisCategory(List<Food> menu) {
    return FoodCategory.values.map(
      (category) {
        List<Food> categoryMenu = _filterMenuCatgeory(category, menu);
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoryMenu.length,
          itemBuilder: (context, index) {
            final food = categoryMenu[index];
            return FoodTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => FoodDetailsScreen(food: food)));
                },
                food: food);
          },
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  CustomSliverAppBar(
                      title: CustomTabBar(tabController: _tabController),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Divider(
                            indent: 25,
                            endIndent: 25,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const CurrentLocation(),
                          const DescriptionBox()
                        ],
                      ))
                ],
            body: Consumer(builder: (context, ref, child) {
              final food = ref.watch(foodProvider);
              return ColoredBox(
                color: Theme.of(context).colorScheme.secondary,
                child: TabBarView(
                  controller: _tabController,
                  children: _getFoodInThisCategory(food.menu),
                ),
              );
            })));
  }
}
