import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/features/auth/pages/login_page.dart';
import 'package:riverpod_chat/src/features/chat/presentation/pages/chats_page.dart';
import 'package:riverpod_chat/src/routing/app_route.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/chats',
    redirect: (context, state) {
      final isLoggedIn = false;
      final path = state.uri.path;
      if (!isLoggedIn) {
        if (path == '/chats') {
          return '/login';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/chats',
        name: AppRoute.chats.name,
        builder: (context, state) => ChatsPage(),
      ),
    ],
  );
}
