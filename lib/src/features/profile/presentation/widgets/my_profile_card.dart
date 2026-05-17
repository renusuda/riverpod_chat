import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/core_widgets/app_card.dart';
import 'package:riverpod_chat/src/features/profile/presentation/providers/my_profile_provider.dart';
import 'package:riverpod_chat/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:riverpod_chat/src/features/profile/presentation/widgets/profile_display_name.dart';
import 'package:riverpod_chat/src/features/profile/presentation/widgets/profile_username.dart';

class MyProfileCard extends ConsumerWidget {
  const MyProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(myProfileProvider);
    final isLoading = asyncValue.isLoading;
    final profile = asyncValue.maybeWhen(data: (p) => p, orElse: () => null);

    return AppCard(
      onTap: null,
      child: ListTile(
        leading: ProfileAvatar(
          avatarUrl: profile?.avatarUrl,
          isLoading: isLoading,
        ),
        title: ProfileDisplayName(
          displayName: profile?.displayName ?? '',
          isLoading: isLoading,
        ),
        subtitle: ProfileUsername(
          username: profile?.username ?? '',
          isLoading: isLoading,
        ),
      ),
    );
  }
}
