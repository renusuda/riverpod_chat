import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_metadata.freezed.dart';

@freezed
abstract class ConversationMetadata with _$ConversationMetadata {
  const factory ConversationMetadata({
    required String partnerId,
    required String lastMessage,
    required DateTime updatedAt,
  }) = _ConversationMetadata;
}
