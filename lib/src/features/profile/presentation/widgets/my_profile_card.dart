import 'package:cached_network_image/cached_network_image.dart';
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
    return const AppCard(
      onTap: null,
      child: ListTile(
        leading: _ProfileAvatar(),
        title: _ProfileDisplayName(),
        subtitle: _ProfileUsername(),
      ),
    );
  }
}

class _ProfileDisplayName extends ConsumerWidget {
  const _ProfileDisplayName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;

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
      style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class _ProfileUsername extends ConsumerWidget {
  const _ProfileUsername();

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
      style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
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

    return CachedNetworkImage(
      imageUrl: avatarUrl ?? '',
      fit: BoxFit.cover,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Image.asset(
        'assets/default_profile.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
