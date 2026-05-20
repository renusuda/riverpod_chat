import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/chat/domain/chat_message.dart';
import 'package:riverpod_chat/src/features/chat/presentation/pages/messages_page.dart';
import 'package:riverpod_chat/src/features/chat/presentation/providers/messages_provider.dart';
import 'package:riverpod_chat/src/theme/app_spacing.dart';

void main() {
  testWidgets('アプリバーにチャット相手の画像と名前が表示されること', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          messagesProvider.overrideWith(
            (ref, conversationId) async => ChatMessage(
              conversationId: conversationId,
              partnerName: 'テストユーザー',
              partnerAvatarUrl: 'https://example.com/avatar.jpg',
            ),
          ),
        ],
        child: const _TestApp(
          home: MessagesPage(conversationId: 'conversation-1'),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('テストユーザー'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.home});

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: const [AppSpacing.standard],
      ),
      home: home,
    );
  }
}
