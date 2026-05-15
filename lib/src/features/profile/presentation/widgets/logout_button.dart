import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/core_widgets/app_card.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    required this.onPressed,
    required this.isLoading,
    super.key,
  });

  final VoidCallback? onPressed;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    const foregroundColor = Color(0xFFF3226A);

    return SizedBox(
      width: double.infinity,
      child: AppCard(
        onTap: isLoading ? null : onPressed,
        child: isLoading
            ? const Center(
                child: SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    color: foregroundColor,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.logout,
                    color: foregroundColor,
                  ),
                  SizedBox(width: spacing.p12),
                  Text(
                    'ログアウト',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: foregroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
