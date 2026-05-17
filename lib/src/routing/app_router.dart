import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_chat/src/core_widgets/scaffold_with_navigation_bar.dart';
import 'package:riverpod_chat/src/features/auth/data/auth_repository_provider.dart';
import 'package:riverpod_chat/src/features/auth/presentation/pages/login_page.dart';
import 'package:riverpod_chat/src/features/chat/presentation/pages/conversations_page.dart';
import 'package:riverpod_chat/src/features/profile/presentation/pages/profile_page.dart';
import 'package:riverpod_chat/src/routing/app_route.dart';
import 'package:riverpod_chat/src/routing/go_router_refresh_stream.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/conversations',
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path == '/login') {
          return '/conversations';
        }
      } else {
        if (path != '/login') {
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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavigationBar(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/conversations',
                name: AppRoute.conversations.name,
                builder: (context, state) => const ConversationsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRoute.profile.name,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
