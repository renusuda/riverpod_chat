import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/features/auth/widgets/email_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Image.asset('assets/app_title.png', width: 300),
              Text(
                'すぐにつながる',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                '友だちと気軽にチャット',
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
              ),
              Image.asset('assets/illustration.png', width: 300),
              const EmailField(),
              const SizedBox(height: 14),
              const _PasswordField(),
              const SizedBox(height: 18),
              const _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

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
        obscureText: true,
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
          prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
          suffixIcon: const Icon(
            Icons.visibility_outlined,
            color: Colors.black,
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

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF3226A),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
        child: Text(
          'ログイン',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
