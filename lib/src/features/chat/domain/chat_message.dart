import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_chat/src/features/chat/domain/message.dart';

part 'chat_message.freezed.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String conversationId,
    required String partnerId,
    required String partnerName,
    required List<Message> messages,
    String? partnerAvatarUrl,
  }) = _ChatMessage;
}
