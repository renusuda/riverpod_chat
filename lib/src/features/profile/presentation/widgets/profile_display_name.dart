import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/profile/presentation/providers/my_profile_provider.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class ProfileDisplayName extends ConsumerWidget {
  const ProfileDisplayName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;
    final myProfileAsyncValue = ref.watch(myProfileProvider);

    if (myProfileAsyncValue.isLoading) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 90,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    }

    final displayName = myProfileAsyncValue.maybeWhen(
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
