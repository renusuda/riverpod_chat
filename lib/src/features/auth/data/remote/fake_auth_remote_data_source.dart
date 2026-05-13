import 'package:flutter/foundation.dart';
import 'package:riverpod_chat/src/features/auth/data/remote/auth_remote_data_source.dart';

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  const FakeAuthRemoteDataSource();

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    debugPrint(email);
    debugPrint(password);
  }
}
