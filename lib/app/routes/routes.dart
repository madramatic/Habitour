import 'package:go_router/go_router.dart';
import 'package:habitour/presentation/screens/home_screen.dart';
import 'package:habitour/presentation/screens/intro_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
