import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_chat/src/features/chat/domain/conversation_metadata.dart';

part 'conversation_dto.freezed.dart';
part 'conversation_dto.g.dart';

@freezed
sealed class ConversationDto with _$ConversationDto {
  const factory ConversationDto({
    required List<String> memberIds,
    @_TimestampConverter() required DateTime updatedAt,
    String? lastMessage,
  }) = _ConversationDto;

  const ConversationDto._();

  factory ConversationDto.fromJson(Map<String, Object?> json) =>
      _$ConversationDtoFromJson(json);

  String _partnerId(String currentUserId) {
    return memberIds.firstWhere(
      (memberId) => memberId != currentUserId,
      orElse: () => '',
    );
  }

  ConversationMetadata toDomain({
    required String id,
    required String currentUserId,
  }) {
    return ConversationMetadata(
      id: id,
      partnerId: _partnerId(currentUserId),
      lastMessage: lastMessage ?? '',
      updatedAt: updatedAt,
    );
  }
}

class _TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const _TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}
