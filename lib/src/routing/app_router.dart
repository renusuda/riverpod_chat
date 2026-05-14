import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/auth/presentation/pages/login_page.dart';
import 'package:riverpod_chat/src/features/chat/presentation/pages/chats_page.dart';
import 'package:riverpod_chat/src/routing/app_route.dart';
import 'package:riverpod_chat/src/routing/go_router_refresh_stream.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/chats',
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path == '/login') {
          return '/chats';
        }
      } else {
        if (path == '/chats') {
          return '/login';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      authRepository.authenticationStateChanges(),
    ),
    routes: [
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/chats',
        name: AppRoute.chats.name,
        builder: (context, state) => const ChatsPage(),
      ),
    ],
  );
}
