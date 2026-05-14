import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';

class ChatsPage extends ConsumerWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () async {
            await ref.read(authRepositoryProvider).logout();
          },
          child: const Text('ログアウト'),
        ),
      ),
    );
  }
}
