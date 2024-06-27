import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/login_or_register_provider.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:food_delivery/screens/register_screen.dart';

class LoginOrRegister extends ConsumerWidget {
  const LoginOrRegister({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginOrRegister = ref.watch(loginOrRegisterProvider);
    if (loginOrRegister) {
      return LoginScreen(
          onTap: ref.read(loginOrRegisterProvider.notifier).tooglePage);
    } else {
      return RegisterScreen(
          onTap: ref.read(loginOrRegisterProvider.notifier).tooglePage);
    }
  }
}
