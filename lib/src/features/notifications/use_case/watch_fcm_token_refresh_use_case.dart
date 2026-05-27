import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository.dart';

class WatchFcmTokenRefreshUseCase {
  const WatchFcmTokenRefreshUseCase({
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  }) : _authRepository = authRepository,
       _profileRepository = profileRepository;

  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  Future<void> execute(String token) async {
    final currentUser = _authRepository.currentUser;
    if (currentUser == null) return;

    await _profileRepository.saveFcmToken(
      uid: currentUser.uid,
      token: token,
    );
  }
}
