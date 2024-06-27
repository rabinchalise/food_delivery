import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/resturant_provider.dart';
import 'package:food_delivery/screens/cart_screen.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        Consumer(
          builder: (context, ref, child) {
            final quantity = ref.watch(foodProvider).cart.length;
            return IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const CartScreen())),
                icon: Badge(
                    label: Text(quantity.toString()),
                    smallSize: 14,
                    child: const Icon(Icons.shopping_cart)));
          },
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Sunset Diner'),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
