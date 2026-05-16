import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/auth/data/remote/auth_remote_data_source.dart';
import 'package:riverpod_chat/src/features/auth/data/remote/firebase_auth_remote_data_source.dart';
import 'package:riverpod_chat/src/firebase/providers/firebase_auth_provider.dart';

part 'auth_repository_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return FirebaseAuthRemoteDataSource(
    firebaseAuth: ref.watch(firebaseAuthProvider),
  );
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepository(remoteDataSource: remoteDataSource);
}
