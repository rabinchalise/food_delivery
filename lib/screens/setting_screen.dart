import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/theme_provider.dart';
import 'package:food_delivery/theme/dark_mode.dart';
import 'package:food_delivery/theme/light_mode.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final theme = ref.read(themeProvider.notifier);
                    return CupertinoSwitch(
                        value: theme.state == darkMode,
                        onChanged: (value) {
                          if (value) {
                            theme.state = darkMode;
                          } else {
                            theme.state = lightMode;
                          }
                        });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
