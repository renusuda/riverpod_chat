import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_chat/src/features/notifications/use_case/watch_fcm_token_refresh_use_case_provider.dart';
import 'package:riverpod_chat/src/routing/app_router.dart';
import 'package:riverpod_chat/src/theme/app_spacing.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(fcmTokenRefreshListenerProvider);
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF3226A)),
        fontFamily: 'LINESeedJP',
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Color(0xFFF3226A));
            }
            return null;
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: Color(0xFFF3226A),
              );
            }
            return null;
          }),
        ),
        appBarTheme: const AppBarTheme(
          // スクロール時にAppBarの背景色が変更されないようにする
          // https://github.com/flutter/flutter/issues/160192
          scrolledUnderElevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        extensions: const [AppSpacing.standard],
      ),
    );
  }
}
