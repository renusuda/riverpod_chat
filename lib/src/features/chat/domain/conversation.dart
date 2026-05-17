import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';

@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String partnerName,
    required String lastMessage,
    required DateTime updatedAt,
    String? partnerAvatarUrl,
  }) = _Conversation;
}
