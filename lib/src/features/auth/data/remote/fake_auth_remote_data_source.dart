import 'dart:async';

import 'package:riverpod_chat/src/features/auth/data/remote/auth_remote_data_source.dart';
import 'package:riverpod_chat/src/features/auth/domain/app_user.dart';

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  AppUser? _currentUser;

  final _authState = StreamController<AppUser?>.broadcast();

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    _setCurrentUser(email: email);
  }

  void _setCurrentUser({required String email}) {
    final user = AppUser(
      uid: email.split('').reversed.join(),
      email: email,
    );
    _currentUser = user;
    _authState.add(user);
  }

  @override
  AppUser? get currentUser => _currentUser;

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  void dispose() {
    unawaited(_authState.close());
  }
}
