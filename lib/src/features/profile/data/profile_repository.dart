import 'package:riverpod_chat/src/features/profile/data/remote/profile_remote_data_source.dart';
import 'package:riverpod_chat/src/features/profile/domain/user_profile.dart';

class ProfileRepository {
  const ProfileRepository({required ProfileRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final ProfileRemoteDataSource _remoteDataSource;

  Future<UserProfile> fetchProfile({required String uid}) {
    return _remoteDataSource.fetchProfile(uid: uid);
  }
}
