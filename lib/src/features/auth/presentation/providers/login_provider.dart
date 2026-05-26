import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/notifications/use_case/save_fcm_token_use_case_provider.dart';

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
      () async {
        await ref
            .read(authRepositoryProvider)
            .login(
              email: email,
              password: password,
            );
        await ref.read(saveFcmTokenUseCaseProvider).execute();
      },
    );
  }
}
