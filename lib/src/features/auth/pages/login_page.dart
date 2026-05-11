import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_chat/src/features/auth/widgets/email_field.dart';
import 'package:riverpod_chat/src/features/auth/widgets/login_button.dart';
import 'package:riverpod_chat/src/features/auth/widgets/password_field.dart';
import 'package:riverpod_chat/src/theme/app_theme.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final spacing = context.spacing;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.p32),
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      EmailField(controller: emailController),
                      SizedBox(height: spacing.p16),
                      PasswordField(controller: passwordController),
                      SizedBox(height: spacing.p20),
                      LoginButton(
                        onPressed: () {
                          debugPrint(emailController.text);
                          debugPrint(passwordController.text);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
