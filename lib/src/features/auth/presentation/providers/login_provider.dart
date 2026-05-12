import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  void build() {}

  void login({
    required String email,
    required String password,
  }) {
    debugPrint(email);
    debugPrint(password);
  }
}
