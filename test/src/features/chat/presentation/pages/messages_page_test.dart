import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/auth/data/remote/auth_remote_data_source.dart';
import 'package:riverpod_chat/src/features/auth/domain/app_user.dart';
import 'package:riverpod_chat/src/features/chat/domain/chat_message.dart';
import 'package:riverpod_chat/src/features/chat/domain/message.dart';
import 'package:riverpod_chat/src/features/chat/presentation/pages/messages_page.dart';
import 'package:riverpod_chat/src/features/chat/presentation/providers/messages_provider.dart';
import 'package:riverpod_chat/src/features/chat/presentation/providers/typing_status_provider.dart';
import 'package:riverpod_chat/src/features/chat/use_case/update_typing_status_use_case.dart';
import 'package:riverpod_chat/src/features/chat/use_case/update_typing_status_use_case_provider.dart';
import 'package:riverpod_chat/src/theme/app_spacing.dart';

void main() {
  testWidgets('アプリバーにチャット相手の画像と名前が表示されること', (tester) async {
    await _pumpMessagesPage(
      tester,
      chatMessage: const ChatMessage(
        conversationId: 'conversation-1',
        partnerId: 'partner-1',
        partnerName: 'テストユーザー',
        partnerAvatarUrl: 'https://example.com/avatar.jpg',
        messages: [],
      ),
    );

    await tester.pump();

    expect(find.text('テストユーザー'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('相手のメッセージにアバターと時刻が表示されること', (tester) async {
    await _pumpMessagesPage(
      tester,
      chatMessage: ChatMessage(
        conversationId: 'conversation-1',
        partnerId: 'partner-1',
        partnerName: 'テストユーザー',
        partnerAvatarUrl: 'https://example.com/avatar.jpg',
        messages: [
          Message(
            id: 'message-1',
            isMe: false,
            text: '週末が楽しみです',
            createdAt: DateTime(2026, 1, 2, 9, 35),
          ),
        ],
      ),
    );

    await tester.pump();

    expect(find.text('週末が楽しみです'), findsOneWidget);
    expect(find.text('09:35'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsNWidgets(2));
  });

  testWidgets('自分のメッセージに本文と時刻が表示され、メッセージアバターは表示されないこと', (
    tester,
  ) async {
    await _pumpMessagesPage(
      tester,
      chatMessage: ChatMessage(
        conversationId: 'conversation-1',
        partnerId: 'partner-1',
        partnerName: 'テストユーザー',
        partnerAvatarUrl: 'https://example.com/avatar.jpg',
        messages: [
          Message(
            id: 'message-1',
            isMe: true,
            text: 'こちらも楽しみです',
            createdAt: DateTime(2026, 1, 2, 9, 36),
          ),
        ],
      ),
    );

    await tester.pump();

    expect(find.text('こちらも楽しみです'), findsOneWidget);
    expect(find.text('09:36'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}

Future<void> _pumpMessagesPage(
  WidgetTester tester, {
  required ChatMessage chatMessage,
}) {
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRemoteDataSourceProvider.overrideWithValue(
          FakeAuthRemoteDataSource(),
        ),
        messagesProvider.overrideWith2(
          (_) => _FakeMessages(chatMessage),
        ),
        typingStatusProvider.overrideWith2((_) => _FakeTypingStatus()),
        updateTypingStatusUseCaseProvider.overrideWithValue(
          _FakeUpdateTypingStatusUseCase(),
        ),
      ],
      child: const _TestApp(
        home: MessagesPage(conversationId: 'conversation-1'),
      ),
    ),
  );
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

class _FakeMessages extends Messages {
  _FakeMessages(this._chatMessage);
  final ChatMessage _chatMessage;

  @override
  Stream<ChatMessage> build({required String conversationId}) {
    return Stream.value(_chatMessage);
  }
}

class _FakeTypingStatus extends TypingStatus {
  @override
  Stream<bool> build({
    required String conversationId,
    required String partnerId,
  }) {
    return Stream.value(false);
  }
}

class _FakeUpdateTypingStatusUseCase implements UpdateTypingStatusUseCase {
  @override
  Future<void> execute({
    required String conversationId,
    required bool isTyping,
  }) async {}
}

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  final _authStateController = StreamController<AppUser?>.broadcast();

  @override
  Future<void> login({required String email, required String password}) async {}

  @override
  Future<void> logout() async {}

  @override
  AppUser? get currentUser => const AppUser(
    uid: 'test-uid',
    email: 'test@example.com',
  );

  @override
  Stream<AppUser?> authStateChanges() => _authStateController.stream;
}
