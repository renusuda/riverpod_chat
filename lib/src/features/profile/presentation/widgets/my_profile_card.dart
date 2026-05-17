import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/core_widgets/app_card.dart';
import 'package:riverpod_chat/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:riverpod_chat/src/features/profile/presentation/widgets/profile_display_name.dart';
import 'package:riverpod_chat/src/features/profile/presentation/widgets/profile_username.dart';

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      onTap: null,
      child: ListTile(
        leading: ProfileAvatar(),
        title: ProfileDisplayName(),
        subtitle: ProfileUsername(),
      ),
    );
  }
}
