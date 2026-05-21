import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_chat/src/features/chat/domain/message.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
sealed class MessageDto with _$MessageDto {
  const factory MessageDto({
    required String senderId,
    required String text,
    @_TimestampConverter() required DateTime createdAt,
  }) = _MessageDto;

  const MessageDto._();

  factory MessageDto.fromJson(Map<String, Object?> json) =>
      _$MessageDtoFromJson(json);

  Message toDomain({
    required String id,
    required String currentUserId,
  }) => Message(
    id: id,
    text: text,
    createdAt: createdAt,
    isMe: senderId == currentUserId,
  );
}

class _TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const _TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}
