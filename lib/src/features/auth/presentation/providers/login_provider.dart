import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  FutureOr<void> build() {}

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .login(
            email: email,
            password: password,
          ),
    );
  }
}
