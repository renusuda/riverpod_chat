// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => _MessageDto(
  senderId: json['senderId'] as String,
  text: json['text'] as String,
  createdAt: const _TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$MessageDtoToJson(_MessageDto instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'text': instance.text,
      'createdAt': const _TimestampConverter().toJson(instance.createdAt),
    };
