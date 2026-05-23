import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/chat/data/conversation_repository_provider.dart';
import 'package:riverpod_chat/src/features/chat/use_case/send_message_use_case.dart';

part 'send_message_use_case_provider.g.dart';

@Riverpod(keepAlive: true)
SendMessageUseCase sendMessageUseCase(Ref ref) {
  return SendMessageUseCase(
    conversationRepository: ref.watch(conversationRepositoryProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
}
