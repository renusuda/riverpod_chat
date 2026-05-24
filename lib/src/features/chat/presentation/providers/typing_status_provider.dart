import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/use_case/update_typing_status_use_case_provider.dart';

part 'typing_status_provider.g.dart';

@riverpod
class TypingStatus extends _$TypingStatus {
  @override
  void build({required String conversationId}) {}

  Future<void> update({required bool isTyping}) async {
    await ref
        .read(updateTypingStatusUseCaseProvider)
        .execute(conversationId: conversationId, isTyping: isTyping);
  }
}
