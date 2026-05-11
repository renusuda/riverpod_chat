import 'package:flutter/material.dart';
import 'package:riverpod_chat/src/features/auth/widgets/email_field.dart';
import 'package:riverpod_chat/src/features/auth/widgets/login_button.dart';
import 'package:riverpod_chat/src/features/auth/widgets/password_field.dart';

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
              const PasswordField(),
              const SizedBox(height: 18),
              const LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
