import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/domain/chat_message.dart';
import 'package:riverpod_chat/src/features/chat/use_case/send_message_use_case_provider.dart';
import 'package:riverpod_chat/src/features/chat/use_case/watch_messages_use_case_provider.dart';

part 'messages_provider.g.dart';

@riverpod
class Messages extends _$Messages {
  @override
  Stream<ChatMessage> build({required String conversationId}) {
    return ref
        .watch(watchMessagesUseCaseProvider)
        .execute(conversationId: conversationId);
  }

  Future<void> send(String text) async {
    await ref
        .read(sendMessageUseCaseProvider)
        .execute(conversationId: conversationId, text: text);
  }
}
