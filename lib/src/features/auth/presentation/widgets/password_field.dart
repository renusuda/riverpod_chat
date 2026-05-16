import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_chat/src/features/auth/domain/password.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class PasswordField extends HookWidget {
  const PasswordField({
    required this.controller,
    required this.textInputAction,
    super.key,
  });

  final TextEditingController controller;

  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final spacing = context.spacing;

    final obscureText = useState(true);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 16,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: Password.validate,
        obscureText: obscureText.value,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: spacing.p16),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
          suffixIcon: IconButton(
            onPressed: () => obscureText.value = !obscureText.value,
            icon: Icon(
              obscureText.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.black,
            ),
          ),
          hintText: 'パスワード',
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
