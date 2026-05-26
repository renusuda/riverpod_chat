import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository.dart';

class SaveFcmTokenUseCase {
  const SaveFcmTokenUseCase({
    required FirebaseMessaging messaging,
    required ProfileRepository profileRepository,
    required AuthRepository authRepository,
  }) : _messaging = messaging,
       _profileRepository = profileRepository,
       _authRepository = authRepository;

  final FirebaseMessaging _messaging;
  final ProfileRepository _profileRepository;
  final AuthRepository _authRepository;

  Future<void> execute() async {
    final settings = await _messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.denied) return;

    await _messaging.getAPNSToken();

    final uid = _authRepository.currentUser!.uid;
    final token = await _messaging.getToken();
    if (token != null) {
      await _profileRepository.saveFcmToken(uid: uid, token: token);
    }
  }
}
