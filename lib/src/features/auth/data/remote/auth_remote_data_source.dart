import 'package:riverpod_chat/src/features/auth/domain/app_user.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> login({
    required String email,
    required String password,
  });

  AppUser? get currentUser;

  Stream<AppUser?> authStateChanges();
}
