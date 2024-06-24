import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vales_app/config/router/app_router_notifier.dart';
import 'package:vales_app/features/admin/presentation/screens/home_screen.dart';
import 'package:vales_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:vales_app/features/auth/presentation/screens/check_auth_status_screen.dart';
import 'package:vales_app/features/auth/presentation/screens/login_screen.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: '/home/:page',
        name: HomeScreen.name,
        builder: (context, state) {
          final pageIndex =
              int.tryParse(state.pathParameters['page'] ?? '0') ?? 0;
          return HomeScreen(pageIndex: pageIndex);
        },
      ),
      GoRoute(
        path: '/',
        redirect: (_, __) => '/home/0',
      ),
      GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      )
    ],
    redirect: (context, state) {
      final isGoingTo =
          state.matchedLocation; // Usar 'location' en lugar de 'subloc'
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      return null;
    },
  );
});
