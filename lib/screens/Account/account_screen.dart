import 'package:flutter/material.dart';
import 'package:temple_on_wheel/screens/Account/account_home.dart';
import 'package:temple_on_wheel/screens/Account/general_screen.dart';
import 'package:temple_on_wheel/screens/Account/payment_method_screen.dart';
import 'package:temple_on_wheel/screens/Account/policy_screen.dart';
import 'package:temple_on_wheel/screens/Account/support_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKey<NavigatorState>(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        late Widget child;

        switch (settings.name) {
          case '/':
            child = const AccountHome();
            break;
          case '/general':
            child = const GeneralScreen();
            break;
          case '/payment':
            child = const PaymentMethodScreen();
            break;
          case '/policy':
            child = const PolicyScreen();
            break;
          case '/support':
            child = const SupportScreen();
            break;
          default:
            child = const Scaffold(body: Center(child: Text("Page not found")));
        }

        return MaterialPageRoute(
          builder: (context) => child,
          settings: settings,
        );
      },
    );
  }
}
