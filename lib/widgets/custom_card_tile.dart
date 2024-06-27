import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/resturant_provider.dart';
import 'package:food_delivery/widgets/custom_quantity_selector.dart';

import '../models/cart_item.dart';

class CustomCardTile extends ConsumerWidget {
  const CustomCardTile({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resturants = ref.watch(foodProvider);

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  cartItem.food.imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.food.name),
                  Text('\$ ${cartItem.food.price}'),
                  const SizedBox(height: 10),
                  QuantitySelecto(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onDecrement: () => resturants.removeFromCart(cartItem),
                      onIncrement: () => resturants.addToCart(
                          cartItem.food, cartItem.selectedAddons))
                ],
              ),
            ],
          ),
          SizedBox(
            height: cartItem.selectedAddons.isEmpty ? 0 : 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              children: [
                ...cartItem.selectedAddons.map((addon) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            Text(addon.name),
                            Text(
                              ' (\$${addon.price.toString()})',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                        shape: StadiumBorder(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        onSelected: (value) {},
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
