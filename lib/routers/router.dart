import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/screens/browse/browse.dart';
import 'package:temple_on_wheel/screens/checkout/checkout.dart';
import 'package:temple_on_wheel/screens/checkout/qr_code.dart';
import 'package:temple_on_wheel/screens/confirm_booking/confirm_booking.dart';
import 'package:temple_on_wheel/layout/primary_layout.dart';
import 'package:temple_on_wheel/screens/Account/account_home.dart';
import 'package:temple_on_wheel/screens/Account/general_screen.dart';
import 'package:temple_on_wheel/screens/Account/payment_method_screen.dart';
import 'package:temple_on_wheel/screens/Account/policy_screen.dart';
import 'package:temple_on_wheel/screens/detail_screen.dart';
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
              routes: [
                GoRoute(
                  path: 'detail',
                  name: 'detail',
                  builder: (context, state) => DetailScreen(),
                ),
                GoRoute(
                  path: 'browse',
                  name: 'browse',
                  builder: (context, state) {
                    final items = state.extra as List<String>? ?? [];
                    return Browse(data: items);
                  },
                  routes: [
                    GoRoute(
                      path: 'detail',
                      name: 'detail1',
                      builder: (context, state) => DetailScreen(),
                      routes: [
                        GoRoute(
                          path: 'confirm_booking',
                          name: 'confirm_booking',
                          builder: (context, state) => ConfirmBooking(),
                          routes: [
                            GoRoute(
                              path: 'qr_code',
                              name: 'qr_code',
                              builder: (context, state) => QRCode(),
                              routes: [
                                GoRoute(
                                  path: 'checkout',
                                  name: 'checkout',
                                  builder: (context, state) => Checkout(),
                                ),
                              ], //u
                            ),
                          ], //use for nested route
                        ),
                      ],
                    ),
                  ],
                ),
              ], //use for nested route
            ),
          ],
        ),

        // Reservation tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/confirm_booking',
              name: 'confirm_booking1',
              builder: (context, state) => ConfirmBooking(),
              routes: [
                GoRoute(
                  path: 'qr_code',
                  name: 'qr_code1',
                  builder: (context, state) => QRCode(),
                  routes: [
                    GoRoute(
                      path: 'checkout',
                      name: 'checkout1',
                      builder: (context, state) => Checkout(),
                    ),
                  ], //use for nested route
                ),
              ], //use for nested route
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
