import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/core_widgets/avatar.dart';
import 'package:riverpod_chat/src/features/profile/presentation/providers/my_profile_provider.dart';

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProfileAsyncValue = ref.watch(myProfileProvider);
    final avatarUrl = myProfileAsyncValue.maybeWhen(
      data: (p) => p.avatarUrl,
      orElse: () => null,
    );

    return Avatar(
      avatarUrl: avatarUrl,
      isLoading: myProfileAsyncValue.isLoading,
    );
  }
}
