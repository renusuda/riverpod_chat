import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/core_widgets/app_card.dart';
import 'package:riverpod_chat/src/features/profile/presentation/providers/my_profile_provider.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return AppCard(
      onTap: null,
      child: Row(
        children: [
          const _ProfileAvatar(),
          SizedBox(width: spacing.p20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ProfileDisplayName(),
                SizedBox(height: spacing.p8),
                const _ProfileUserId(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileDisplayName extends ConsumerWidget {
  const _ProfileDisplayName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayName = ref
        .watch(myProfileProvider)
        .maybeWhen(
          data: (profile) => profile.displayName,
          orElse: () => '',
        );

    return Text(
      displayName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _ProfileUserId extends ConsumerWidget {
  const _ProfileUserId();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref
        .watch(myProfileProvider)
        .maybeWhen(
          data: (profile) => profile.username,
          orElse: () => '',
        );

    return Text(
      '@$username',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.titleMedium?.copyWith(
        color: Colors.grey,
      ),
    );
  }
}

class _ProfileAvatar extends ConsumerWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarUrl = ref
        .watch(myProfileProvider)
        .maybeWhen(data: (p) => p.avatarUrl, orElse: () => null);

    return SizedBox.square(
      dimension: 75,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipOval(
              child: avatarUrl != null
                  ? Image.network(avatarUrl, fit: BoxFit.cover)
                  : Image.asset(
                      'assets/default_profile.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: _OnlineStatus(),
          ),
        ],
      ),
    );
  }
}

class _OnlineStatus extends StatelessWidget {
  const _OnlineStatus();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: const Color(0xFF1FE66E),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
    );
  }
}
