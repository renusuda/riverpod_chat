import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({required this.avatarUrl, super.key});

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: CachedNetworkImage(
        imageUrl: avatarUrl ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const CircularProgressIndicator(strokeWidth: 2),
        errorWidget: (context, url, error) =>
            Image.asset('assets/default_profile.png', fit: BoxFit.cover),
      ),
    );
  }
}
