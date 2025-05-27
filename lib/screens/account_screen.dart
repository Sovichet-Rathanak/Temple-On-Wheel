import 'package:flutter/material.dart';
import 'package:temple_on_wheel/constants/theme.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kMainThemeColor,
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                //Heading
                Text(
                  "Temple \nOn Wheels",
                  softWrap: true,
                  style: TextStyle(
                    color: kSecondaryThemeColor,
                    fontFamily: "ClimateCrisis",
                    fontSize: 16,
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
                        radius: 120,
                        child: CircleAvatar(
                          backgroundColor: kSecondaryThemeColor,
                          backgroundImage: AssetImage(
                            'assets/images/orang.jpg',
                          ),
                          radius: 115,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kMainThemeColor,
                          border: Border.all(
                            color: kSecondaryThemeColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: IconButton(
                          onPressed: () {
                            print("Do something XDD");
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                          iconSize: 25,
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
                    fontSize: 28
                  ),
                ),

                Container(
                  
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
