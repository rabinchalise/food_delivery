import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/resturant_provider.dart';

class CurrentLocation extends ConsumerWidget {
  const CurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context, WidgetRef ref) {
    final TextEditingController textController = TextEditingController();
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  side: BorderSide.none),
              title: const Text('Your Location'),
              content: TextField(
                controller: textController,
                decoration: const InputDecoration(hintText: 'Enter address'),
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    textController.clear();
                  },
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    String newAddress = textController.text;
                    ref.read(foodProvider).updateDeliveryAddress(newAddress);

                    Navigator.pop(context);
                    textController.clear();
                  },
                  child: const Text('Save'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(foodProvider).deliveryAddress;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context, ref),
            child: Row(
              children: [
                Text(location,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold)),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
