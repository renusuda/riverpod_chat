import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/profile/presentation/providers/my_profile_provider.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class ProfileUsername extends ConsumerWidget {
  const ProfileUsername({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProfileAsyncValue = ref.watch(myProfileProvider);

    if (myProfileAsyncValue.isLoading) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 80,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    }

    final username = myProfileAsyncValue.maybeWhen(
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
