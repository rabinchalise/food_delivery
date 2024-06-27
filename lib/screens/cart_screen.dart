import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/resturant_provider.dart';
import 'package:food_delivery/screens/payment_screen.dart';
import 'package:food_delivery/widgets/custom_buttons.dart';
import 'package:food_delivery/widgets/custom_card_tile.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  void clearItem(BuildContext context, WidgetRef ref) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            title: const Text('Are you sure you want to clear the cart?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.read(foodProvider).clearcart();
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resturant = ref.watch(foodProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () => clearItem(context, ref),
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                resturant.cart.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            "Cart is empty...",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: resturant.cart.length,
                            itemBuilder: (context, index) {
                              final cartItem = resturant.cart[index];
                              return CustomCardTile(cartItem: cartItem);
                            }))
              ],
            ),
          ),
          CustomButton(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const PaymentScreen())),
              text: "Go to checkout"),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
