import 'package:go_router/go_router.dart';
import 'package:vales_app/features/admin/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.tryParse(state.pathParameters['page'] ?? '0') ?? 0;
        return HomeScreen(pageIndex: pageIndex);
      },
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
