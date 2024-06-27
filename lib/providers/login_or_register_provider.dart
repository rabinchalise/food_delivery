import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginOrRegisterProvider extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void tooglePage() {
    state = !state;
  }
}

final loginOrRegisterProvider = NotifierProvider<LoginOrRegisterProvider, bool>(
    LoginOrRegisterProvider.new);
