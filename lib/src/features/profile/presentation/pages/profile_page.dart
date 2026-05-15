import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/profile/presentation/providers/profile_provider.dart';
import 'package:riverpod_chat/src/features/profile/presentation/widgets/logout_button.dart';
import 'package:riverpod_chat/src/features/profile/presentation/widgets/my_profile_card.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.spacing;

    final profileState = ref.watch(profileProvider);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(spacing.p24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const MyProfileCard(),
              SizedBox(height: spacing.p8),
              LogoutButton(
                isLoading: profileState.isLoading,
                onPressed: profileState.isLoading
                    ? null
                    : () async {
                        await ref.read(profileProvider.notifier).logout();
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
