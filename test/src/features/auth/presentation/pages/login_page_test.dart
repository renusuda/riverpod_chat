import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/app.dart';
import 'package:riverpod_chat/src/exceptions/app_exception.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/auth/data/remote/auth_remote_data_source.dart';
import 'package:riverpod_chat/src/features/auth/domain/app_user.dart';
import 'package:riverpod_chat/src/features/auth/presentation/pages/login_page.dart';
import 'package:riverpod_chat/src/features/chat/presentation/pages/conversations_page.dart';

import '../../../../../helpers/widget_tester_extension.dart';

void main() {
  testWidgets('メールアドレスが空でログインするとエラーが表示され、ログイン画面に留まる', (
    tester,
  ) async {
    final fakeRemoteDataSource = FakeAuthRemoteDataSource();
    await _pumpApp(tester, remoteDataSource: fakeRemoteDataSource);

    await _tapLoginButton(tester);
    await tester.pumpAndSettle();

    expect(find.text('メールアドレスを入力してください'), findsOneWidget);
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('パスワードが空でログインするとエラーが表示され、ログイン画面に留まる', (
    tester,
  ) async {
    final fakeRemoteDataSource = FakeAuthRemoteDataSource();
    await _pumpApp(tester, remoteDataSource: fakeRemoteDataSource);

    await _tapLoginButton(tester);
    await tester.pumpAndSettle();

    expect(find.text('パスワードを入力してください'), findsOneWidget);
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('入力済みでもユーザーがいなければエラーが表示され、ログイン画面に留まる', (
    tester,
  ) async {
    final fakeRemoteDataSource = FakeAuthRemoteDataSource();
    await _pumpApp(tester, remoteDataSource: fakeRemoteDataSource);

    await _enterEmail(tester, 'test@test.com');
    await _enterPassword(tester, 'password');
    await _tapLoginButton(tester);
    await tester.pumpAndSettle();

    expect(find.text('メールアドレスまたはパスワードが正しくありません'), findsOneWidget);
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('存在するアカウントでログインするとホーム画面に遷移する', (tester) async {
    final fakeRemoteDataSource = FakeAuthRemoteDataSource(
      existsUser: true,
    );
    await _pumpApp(tester, remoteDataSource: fakeRemoteDataSource);

    await _enterEmail(tester, 'test@test.com');
    await _enterPassword(tester, 'password');
    await _tapLoginButton(tester);
    await tester.pumpUntilFound(find.byType(ConversationsPage));

    expect(find.byType(ConversationsPage), findsOneWidget);
  });
}

Future<void> _pumpApp(
  WidgetTester tester, {
  required FakeAuthRemoteDataSource remoteDataSource,
}) {
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRemoteDataSourceProvider.overrideWithValue(remoteDataSource),
      ],
      child: const App(),
    ),
  );
}

Future<void> _enterEmail(WidgetTester tester, String email) {
  return tester.enterText(find.byType(TextFormField).at(0), email);
}

Future<void> _enterPassword(WidgetTester tester, String password) {
  return tester.enterText(find.byType(TextFormField).at(1), password);
}

Future<void> _tapLoginButton(WidgetTester tester) async {
  final button = find.byType(ElevatedButton);
  await tester.ensureVisible(button);
  await tester.pumpAndSettle();
  await tester.tap(button);
}

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  FakeAuthRemoteDataSource({
    this.existsUser = false,
  });

  final bool existsUser;

  final _authStateController = StreamController<AppUser?>.broadcast();

  AppUser? _currentUser;

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (!existsUser) {
      throw AuthInvalidCredentialsException();
    }

    _currentUser = AppUser(uid: 'test-uid', email: email);
    _authStateController.add(_currentUser);
  }

  @override
  Future<void> logout() async {}

  @override
  AppUser? get currentUser => _currentUser;

  @override
  Stream<AppUser?> authStateChanges() {
    return _authStateController.stream;
  }
}
