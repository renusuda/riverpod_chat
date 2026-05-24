import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/chat/use_case/update_typing_status_use_case_provider.dart';
import 'package:riverpod_chat/src/features/chat/use_case/watch_partner_typing_status_use_case_provider.dart';

part 'typing_status_provider.g.dart';

@riverpod
class TypingStatus extends _$TypingStatus {
  @override
  Stream<bool> build({
    required String conversationId,
    required String partnerId,
  }) {
    return ref
        .watch(watchPartnerTypingStatusUseCaseProvider)
        .execute(conversationId: conversationId, partnerId: partnerId);
  }

  Future<void> updateIsTyping({required bool isTyping}) async {
    await ref
        .read(updateTypingStatusUseCaseProvider)
        .execute(conversationId: conversationId, isTyping: isTyping);
  }
}
