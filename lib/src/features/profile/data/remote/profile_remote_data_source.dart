import 'package:riverpod_chat/src/features/profile/domain/user_profile.dart';

// ignore: one_member_abstracts, Kept as interface for testability via mocking
abstract interface class ProfileRemoteDataSource {
  Future<UserProfile> fetchProfile({required String uid});
}
