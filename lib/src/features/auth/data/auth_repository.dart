import 'package:riverpod_chat/src/features/auth/data/remote/auth_remote_data_source.dart';

class AuthRepository {
  const AuthRepository({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;

  Future<void> login({
    required String email,
    required String password,
  }) {
    return _remoteDataSource.login(
      email: email,
      password: password,
    );
  }
}
