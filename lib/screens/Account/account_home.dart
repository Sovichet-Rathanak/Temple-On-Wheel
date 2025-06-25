import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/components/AccountComponents/account_setting_btn.dart';
import 'package:temple_on_wheel/components/AccountComponents/account_setting_line.dart';
import 'package:temple_on_wheel/constants/theme.dart';
import 'package:temple_on_wheel/services/auth_service.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  Future<void> _handleSignOut(BuildContext context) async {
    final authService = AuthService();

    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );

    if (shouldSignOut == true) {
      try {
        await authService.signOut();
        if (context.mounted) {
          context.go('/landing');
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error signing out: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kMainThemeColor,
          child: SafeArea(
            child: ListView(
              children: [
                // Heading
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Temple \nOn Wheels",
                    softWrap: true,
                    style: TextStyle(
                      color: kSecondaryThemeColor,
                      fontFamily: "ClimateCrisis",
                      fontSize: 16,
                    ),
                  ),
                ),

                // Avatar
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: CircleAvatar(
                            backgroundColor: kSecondaryThemeColor,
                            radius: 90,
                            child: CircleAvatar(
                              backgroundColor: kSecondaryThemeColor,
                              backgroundImage: AssetImage(
                                'assets/images/orang.jpg',
                              ),
                              radius: 85,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kMainThemeColor,
                              border: Border.all(
                                color: kSecondaryThemeColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                print("Do something XDD");
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.white,
                              iconSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  "Welcome!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: kSecondaryThemeColor,
                    fontSize: 28,
                  ),
                ),

                // Floating container
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.symmetric(vertical: 35, horizontal: 22),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 25,
                          spreadRadius: 0,
                          offset: const Offset(0, -8),
                        ),
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 50,
                          spreadRadius: 0,
                          offset: const Offset(0, -4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Settings",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            children: [
                              AccountSettingBtn(
                                onTap: () {
                                  context.goNamed("general");
                                },
                                icon: Icons.settings,
                                label: "General",
                              ),
                              AccountsettingBtnLine(),
                              AccountSettingBtn(
                                onTap: () {
                                  context.goNamed("payment");
                                },
                                icon: Icons.credit_card,
                                label: "Payment Methods",
                              ),
                              AccountsettingBtnLine(),
                              AccountSettingBtn(
                                onTap: () {
                                  context.goNamed("policy");
                                },
                                label: "Privacy Policy",
                                icon: Icons.question_mark,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: AccountSettingBtn(
                            onTap: () => _handleSignOut(context),
                            label: "Sign Out",
                            icon: Icons.logout,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
