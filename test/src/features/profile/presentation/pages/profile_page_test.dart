import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/app.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/auth/data/remote/auth_remote_data_source.dart';
import 'package:riverpod_chat/src/features/auth/domain/app_user.dart';
import 'package:riverpod_chat/src/features/auth/presentation/pages/login_page.dart';
import 'package:riverpod_chat/src/features/profile/domain/user_profile.dart';
import 'package:riverpod_chat/src/features/profile/presentation/providers/my_profile_provider.dart';

import '../../../../../helpers/widget_tester_extension.dart';

void main() {
  late FakeAuthRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = FakeAuthRemoteDataSource();
  });

  testWidgets('ユーザーの画像・displayName・usernameが表示されること', (tester) async {
    await _pumpApp(tester, remoteDataSource: remoteDataSource);
    await tester.tap(find.text('プロフィール'));
    await tester.pumpUntilFound(find.byType(CachedNetworkImage));

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('テストユーザー'), findsOneWidget);
    expect(find.text('@testuser'), findsOneWidget);
  });

  testWidgets('ログアウトボタンでホーム画面に戻ること', (tester) async {
    await _pumpApp(tester, remoteDataSource: remoteDataSource);
    await tester.tap(find.text('プロフィール'));
    await tester.pumpUntilFound(find.text('ログアウト'));

    await tester.tap(find.text('ログアウト'));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
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
        myProfileProvider.overrideWith(
          (ref) async => const UserProfile(
            displayName: 'テストユーザー',
            username: 'testuser',
            avatarUrl: 'https://example.com/avatar.jpg',
          ),
        ),
      ],
      child: const App(),
    ),
  );
}

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  final _authStateController = StreamController<AppUser?>.broadcast();
  AppUser? _currentUser = const AppUser(
    uid: 'test-uid',
    email: 'test@example.com',
  );

  @override
  Future<void> login({required String email, required String password}) async {}

  @override
  Future<void> logout() async {
    _currentUser = null;
    _authStateController.add(null);
  }

  @override
  AppUser? get currentUser => _currentUser;

  @override
  Stream<AppUser?> authStateChanges() => _authStateController.stream;
}
