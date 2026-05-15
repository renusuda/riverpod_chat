import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';

part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  FutureOr<void> build() {}

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).logout(),
    );
  }
}
