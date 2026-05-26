import 'package:riverpod_chat/src/features/profile/data/remote/profile_remote_data_source.dart';
import 'package:riverpod_chat/src/features/profile/domain/user_profile.dart';

class ProfileRepository {
  const ProfileRepository({required ProfileRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final ProfileRemoteDataSource _remoteDataSource;

  Future<UserProfile> fetchProfile({required String uid}) {
    return _remoteDataSource.fetchProfile(uid: uid);
  }

  Future<void> saveFcmToken({required String uid, required String token}) =>
      _remoteDataSource.saveFcmToken(uid: uid, token: token);

  Future<void> deleteFcmToken({required String uid}) =>
      _remoteDataSource.deleteFcmToken(uid: uid);
}
