import 'package:go_router/go_router.dart';
import 'package:vibe/app/authentication/ui/login_screen.dart';
import 'package:vibe/app/authentication/ui/register_screen.dart';
import 'package:vibe/app/home/interactor/entities/event.dart';
import 'package:vibe/app/home/ui/event_details_screen.dart';
import 'package:vibe/app/home/ui/home_screen.dart';
import 'package:vibe/app/splash_screen.dart';

class Routers {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        name: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
          path: '/event-details',
          name: '/event-details',
          builder: (context, state) {
            return EventDetailsScreen(event: state.extra as Event);
          })
    ],
  );
}
