import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository.dart';

class DeleteFcmTokenUseCase {
  const DeleteFcmTokenUseCase({
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
    required FirebaseMessaging messaging,
  }) : _authRepository = authRepository,
       _profileRepository = profileRepository,
       _messaging = messaging;

  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;
  final FirebaseMessaging _messaging;

  Future<void> execute() async {
    final uid = _authRepository.currentUser!.uid;
    await _profileRepository.deleteFcmToken(uid: uid);
    await _messaging.deleteToken();
  }
}
