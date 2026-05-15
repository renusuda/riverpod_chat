import 'package:flutter/material.dart';
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

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF3226A),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.symmetric(
            vertical: spacing.p16,
            horizontal: spacing.p32,
          ),
        ),
        child: isLoading
            ? const SizedBox.square(
                dimension: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                'ログアウト',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
