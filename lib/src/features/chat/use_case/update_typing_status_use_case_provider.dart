import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/chat/data/typing_repository_provider.dart';
import 'package:riverpod_chat/src/features/chat/use_case/update_typing_status_use_case.dart';

part 'update_typing_status_use_case_provider.g.dart';

@Riverpod(keepAlive: true)
UpdateTypingStatusUseCase updateTypingStatusUseCase(Ref ref) {
  return UpdateTypingStatusUseCase(
    typingRepository: ref.watch(typingRepositoryProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
}
