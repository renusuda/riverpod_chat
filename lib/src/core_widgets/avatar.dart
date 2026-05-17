import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    required this.avatarUrl,
    this.size = 50.0,
    this.isLoading = false,
    super.key,
  });

  final String? avatarUrl;

  final double size;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox.square(
        dimension: size,
        child: _AvatarShimmer(size: size),
      );
    }
    return SizedBox.square(
      dimension: size,
      child: CachedNetworkImage(
        imageUrl: avatarUrl ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) => _AvatarShimmer(size: size),
        errorWidget: (context, url, error) =>
            Image.asset('assets/default_profile.png', fit: BoxFit.cover),
      ),
    );
  }
}

class _AvatarShimmer extends StatelessWidget {
  const _AvatarShimmer({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
