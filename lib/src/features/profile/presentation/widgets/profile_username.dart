import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class ProfileUsername extends StatelessWidget {
  const ProfileUsername({
    required this.username,
    required this.isLoading,
    super.key,
  });

  final String username;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
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

    return Text(
      '@$username',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
    );
  }
}
