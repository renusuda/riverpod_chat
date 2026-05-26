import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/notifications/use_case/delete_fcm_token_use_case_provider.dart';

part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  FutureOr<void> build() {}

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await ref.read(deleteFcmTokenUseCaseProvider).execute();
        await ref.read(authRepositoryProvider).logout();
      },
    );
  }
}
