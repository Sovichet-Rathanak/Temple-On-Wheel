import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/layout/primary_layout.dart';
import 'package:temple_on_wheel/screens/Account/account_home.dart';
import 'package:temple_on_wheel/screens/Account/general_screen.dart';
import 'package:temple_on_wheel/screens/Account/payment_method_screen.dart';
import 'package:temple_on_wheel/screens/Account/policy_screen.dart';
import 'package:temple_on_wheel/screens/e_station_screen.dart';
import 'package:temple_on_wheel/screens/history_screen.dart';
import 'package:temple_on_wheel/screens/home_screen.dart';
import 'package:temple_on_wheel/screens/reservation_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
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
              routes: [], //use for nested route
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
              routes: [], //use for nested route
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
              routes: [], //use for nested route
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
              routes: [], //use for nested route
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
              routes: [
                GoRoute(
                  path: 'general',
                  name: 'general',
                  builder: (context, state) => GeneralScreen(),
                ),
                GoRoute(
                  path: 'payment',
                  name: 'payment',
                  builder: (context, state) => PaymentMethodScreen(),
                ),
                GoRoute(
                  path: 'privacy-policy',
                  name: 'policy',
                  builder: (context, state) => PolicyScreen(),
                ),
              ], //use for nested route
            ),
          ],
        ),
      ],
    ),
  ],
);
