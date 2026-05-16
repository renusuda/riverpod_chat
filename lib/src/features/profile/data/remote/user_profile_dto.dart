import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_chat/src/features/profile/domain/user_profile.dart';

part 'user_profile_dto.freezed.dart';
part 'user_profile_dto.g.dart';

@freezed
sealed class UserProfileDto with _$UserProfileDto {
  const factory UserProfileDto({
    required String displayName,
    required String username,
    String? avatarUrl,
  }) = _UserProfileDto;

  const UserProfileDto._();

  factory UserProfileDto.fromJson(Map<String, Object?> json) =>
      _$UserProfileDtoFromJson(json);

  UserProfile toDomain() => UserProfile(
    displayName: displayName,
    username: username,
    avatarUrl: avatarUrl,
  );
}
