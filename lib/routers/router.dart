import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/layout/primary_layout.dart';
import 'package:temple_on_wheel/screens/account_screen.dart';
import 'package:temple_on_wheel/screens/e_station_screen.dart';
import 'package:temple_on_wheel/screens/history_screen.dart';
import 'package:temple_on_wheel/screens/home_screen.dart';
import 'package:temple_on_wheel/screens/reservation_screen.dart';
import 'package:temple_on_wheel/screens/Authen_Pages/landing_screen.dart';
import 'package:temple_on_wheel/screens/Authen_Pages/onboarding_screen.dart';
import 'package:temple_on_wheel/screens/Authen_Pages/signIn_screen.dart';
import 'package:temple_on_wheel/screens/Authen_Pages/signUp_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/landing', // Changed to start with landing page
  routes: [
    // Authentication routes (outside of shell)
    GoRoute(
      path: '/landing',
      name: 'landing',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    
    // Main app routes (with shell)
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              PrimaryLayout(navigationShell: navigationShell),
      branches: [
        // Home tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => HomeScreen(),
              routes: [] //use for nested route
            ),
          ],
        ),
        
        // Reservation tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/reservation',
              name: 'reservation',
              builder: (context, state) => ReservationScreen(),
              routes: [] //use for nested route
            ),
          ],
        ),

        // E-Station tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/station',
              name: 'station',
              builder: (context, state) => StationScreen(),
              routes: [] //use for nested route
            ),
          ],
        ),

        // History tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/history',
              name: 'history',
              builder: (context, state) => HistoryScreen(),
              routes: [] //use for nested route
            ),
          ],
        ),

        // Account tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/account',
              name: 'account',
              builder: (context, state) => AccountScreen(),
              routes: [] //use for nested route
            ),
          ],
        ),
      ],
    ),
  ],
);
