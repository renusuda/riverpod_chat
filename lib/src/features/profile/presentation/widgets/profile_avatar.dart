import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/core_widgets/avatar.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    required this.avatarUrl,
    required this.isLoading,
    super.key,
  });

  final String? avatarUrl;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Avatar(
      avatarUrl: avatarUrl,
      isLoading: isLoading,
    );
  }
}
