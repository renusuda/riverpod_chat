import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/notifications/use_case/save_fcm_token_use_case.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository_provider.dart';
import 'package:riverpod_chat/src/firebase/providers/firebase_messaging_provider.dart';

part 'save_fcm_token_use_case_provider.g.dart';

@riverpod
SaveFcmTokenUseCase saveFcmTokenUseCase(Ref ref) {
  return SaveFcmTokenUseCase(
    messaging: ref.watch(firebaseMessagingProvider),
    profileRepository: ref.watch(profileRepositoryProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
}
