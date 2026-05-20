import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/domain/chat_message.dart';
import 'package:riverpod_chat/src/features/chat/use_case/fetch_messages_use_case_provider.dart';

part 'messages_provider.g.dart';

@riverpod
Future<ChatMessage> messages(
  Ref ref, {
  required String conversationId,
}) {
  return ref
      .watch(fetchMessagesUseCaseProvider)
      .execute(
        conversationId: conversationId,
      );
}
