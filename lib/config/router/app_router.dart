import 'package:go_router/go_router.dart';
import 'package:vales_app/features/admin/admin.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const AdminScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const AdminScreen(),
    ),

    ///* Home router
    GoRoute(
      path: '/',
      builder: (context, state) => const AdminScreen(),
    ),

    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],

  ///! TODO: Bloquear si no se está autenticado de alguna manera
);
