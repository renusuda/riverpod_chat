import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/chat/data/conversation_repository_provider.dart';
import 'package:riverpod_chat/src/features/chat/use_case/watch_messages_use_case.dart';
import 'package:riverpod_chat/src/features/profile/data/profile_repository_provider.dart';

part 'watch_messages_use_case_provider.g.dart';

@Riverpod(keepAlive: true)
WatchMessagesUseCase watchMessagesUseCase(Ref ref) {
  return WatchMessagesUseCase(
    conversationRepository: ref.watch(conversationRepositoryProvider),
    authRepository: ref.watch(authRepositoryProvider),
    profileRepository: ref.watch(profileRepositoryProvider),
  );
}
