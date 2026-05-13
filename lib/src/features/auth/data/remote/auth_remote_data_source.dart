// Auth operations will be added to this boundary incrementally.
// ignore: one_member_abstracts
abstract interface class AuthRemoteDataSource {
  Future<void> login({
    required String email,
    required String password,
  });
}
