import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
          prefixIcon: const Icon(Icons.mail_outline, color: Colors.black),
          hintText: 'メールアドレス',
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
