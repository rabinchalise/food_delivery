import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    final secondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('\$0.99', style: primaryTextStyle),
              Text(
                'Delivery Fee',
                style: secondaryTextStyle,
              )
            ],
          ),
          Column(
            children: [
              Text(
                '15-30 min',
                style: primaryTextStyle,
              ),
              Text(
                'Delivery time',
                style: secondaryTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
