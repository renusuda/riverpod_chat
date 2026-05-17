import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class ProfileDisplayName extends StatelessWidget {
  const ProfileDisplayName({
    required this.displayName,
    required this.isLoading,
    super.key,
  });

  final String displayName;
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

    return Text(
      displayName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.titleMedium
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
