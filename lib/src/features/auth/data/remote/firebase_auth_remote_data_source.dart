import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_chat/src/exceptions/app_exception.dart';
import 'package:riverpod_chat/src/features/auth/data/remote/auth_remote_data_source.dart';
import 'package:riverpod_chat/src/features/auth/data/remote/firebase_user_mapper.dart';
import 'package:riverpod_chat/src/features/auth/domain/app_user.dart';

class FirebaseAuthRemoteDataSource implements AuthRemoteDataSource {
  FirebaseAuthRemoteDataSource({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (exception) {
      throw switch (exception.code) {
        'email-already-in-use' ||
        'user-not-found' ||
        'wrong-password' ||
        'invalid-credential' => AuthInvalidCredentialsException(),
        _ => exception,
      };
    }
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  @override
  AppUser? get currentUser => _firebaseAuth.currentUser?.toDomain();

  @override
  Stream<AppUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(
      (user) => user?.toDomain(),
    );
  }
}
