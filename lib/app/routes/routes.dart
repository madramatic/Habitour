import 'package:go_router/go_router.dart';
import 'package:habitour/features/intro/presentation/pages/intro_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'intro',
      path: '/',
      builder: (context, state) => const IntroScreen(),
    ),
  ],
);
