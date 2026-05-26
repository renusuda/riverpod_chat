import 'package:riverpod_chat/src/features/profile/domain/user_profile.dart';

abstract interface class ProfileRemoteDataSource {
  Future<UserProfile> fetchProfile({required String uid});
  Future<void> saveFcmToken({required String uid, required String token});
  Future<void> deleteFcmToken({required String uid});
}
