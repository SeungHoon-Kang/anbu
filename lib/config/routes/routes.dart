import 'package:go_router/go_router.dart';

import '../../presentation/bloc/main_screen.dart';
import '../../presentation/pages/views/sign_in/sign_in.dart';
import '../../presentation/pages/views/sign_in/sign_up.dart';
import '../../presentation/pages/views/splash/splash_page.dart';
import 'route_path.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.splash,
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RoutePath.signup,
      name: 'signup',
      builder: (context, state) => const Signup(),
    ),
    GoRoute(
      path: RoutePath.login,
      name: 'login',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: RoutePath.home,
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
  ],
  initialLocation: '/splash',
);
