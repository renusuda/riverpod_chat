import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/notifications/use_case/delete_fcm_token_use_case.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository_provider.dart';
import 'package:riverpod_chat/src/firebase/providers/firebase_messaging_provider.dart';

part 'delete_fcm_token_use_case_provider.g.dart';

@riverpod
DeleteFcmTokenUseCase deleteFcmTokenUseCase(Ref ref) {
  return DeleteFcmTokenUseCase(
    authRepository: ref.watch(authRepositoryProvider),
    profileRepository: ref.watch(profileRepositoryProvider),
    messaging: ref.watch(firebaseMessagingProvider),
  );
}
