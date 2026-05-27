import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/notifications/use_case/watch_fcm_token_refresh_use_case.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository_provider.dart';
import 'package:riverpod_chat/src/firebase/providers/firebase_messaging_provider.dart';

part 'watch_fcm_token_refresh_use_case_provider.g.dart';

@riverpod
Raw<Stream<String>> fcmTokenRefreshStream(Ref ref) {
  return ref.watch(firebaseMessagingProvider).onTokenRefresh;
}

@riverpod
WatchFcmTokenRefreshUseCase watchFcmTokenRefreshUseCase(Ref ref) {
  return WatchFcmTokenRefreshUseCase(
    authRepository: ref.watch(authRepositoryProvider),
    profileRepository: ref.watch(profileRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
void fcmTokenRefreshListener(Ref ref) {
  final subscription = ref
      .watch(fcmTokenRefreshStreamProvider)
      .listen(
        (token) => ref.read(watchFcmTokenRefreshUseCaseProvider).execute(token),
      );
  ref.onDispose(subscription.cancel);
}
