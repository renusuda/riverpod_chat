// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationDto _$ConversationDtoFromJson(Map<String, dynamic> json) =>
    _ConversationDto(
      memberIds: (json['memberIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      updatedAt: const _TimestampConverter().fromJson(
        json['updatedAt'] as Timestamp,
      ),
      lastMessage: json['lastMessage'] as String?,
    );

Map<String, dynamic> _$ConversationDtoToJson(_ConversationDto instance) =>
    <String, dynamic>{
      'memberIds': instance.memberIds,
      'updatedAt': const _TimestampConverter().toJson(instance.updatedAt),
      'lastMessage': instance.lastMessage,
    };
