import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/resturant_provider.dart';

class CustomReceipt extends StatelessWidget {
  const CustomReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thank you for your order!'),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8)),
              child: Consumer(
                builder: (context, ref, child) {
                  final resturant = ref.watch(foodProvider);
                  return Text(resturant.displayCartReceipt());
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text("Estimated delivery time is: 4:10 PM")
          ],
        ),
      ),
    );
  }
}
