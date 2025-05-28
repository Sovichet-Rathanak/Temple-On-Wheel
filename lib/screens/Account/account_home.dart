import 'package:flutter/material.dart';
import 'package:temple_on_wheel/components/AccountComponents/account_setting_btn.dart';
import 'package:temple_on_wheel/components/AccountComponents/account_setting_line.dart';
import 'package:temple_on_wheel/constants/theme.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kMainThemeColor,
          child: SafeArea(
            child: ListView(
              children: [
                //Heading
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

                //Avatar
                Stack(
                  alignment: Alignment.center,
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
                      bottom: 10,
                      right: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kMainThemeColor,
                          border: Border.all(
                            color: kSecondaryThemeColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
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
                SizedBox(height: 25),
                Text(
                  "Hi Schlawg!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: kSecondaryThemeColor,
                    fontSize: 28,
                  ),
                ),

                //Floating container
                Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.all(22),
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
                          "Setting",
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
                              onTap:
                                  () => Navigator.of(
                                    context,
                                  ).pushNamed('/general'),
                              icon: Icons.settings,
                              label: "General",
                            ),
                            AccountsettingBtnLine(),
                            AccountSettingBtn(
                              onTap:
                                  () => Navigator.of(
                                    context,
                                  ).pushNamed('/payment'),
                              icon: Icons.credit_card,
                              label: "Payment Methods",
                            ),
                            AccountsettingBtnLine(),
                            AccountSettingBtn(
                              onTap:
                                  () => Navigator.of(
                                    context,
                                  ).pushNamed('/policy'),
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
                          onTap:
                              () => Navigator.of(context).pushNamed('/support'),
                          label: "Customer Support",
                          icon: Icons.support_agent,
                        ),
                      ),
                    ],
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
