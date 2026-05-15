import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    required this.onTap,
    super.key,
  });

  final Widget child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Card(
      color: Colors.white,
      elevation: 1,
      shadowColor: const Color(0x26000000),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFFF0EAF3)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(spacing.p12),
          child: child,
        ),
      ),
    );
  }
}
