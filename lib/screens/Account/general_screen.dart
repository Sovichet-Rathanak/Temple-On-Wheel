import 'package:flutter/material.dart';
import 'package:temple_on_wheel/components/AccountComponents/SettingBaseAppbar.dart';
import 'package:temple_on_wheel/components/AccountComponents/acount_detail_item.dart';
import 'package:temple_on_wheel/components/AccountComponents/change_password_btn.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SettingBaseAppBar(title: "General", appBar: AppBar()),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            const Text(
              "Account Details",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const AccountDetailItems(
              itemTitle: "Username",
              subTitle: 'schlawg',
              titleSize: 16,
            ),
            const AccountDetailItems(
              itemTitle: "Email",
              subTitle: 'meow_schlawg@gmail.com',
              titleSize: 16,
            ),
            const SizedBox(height: 30),
            const Text(
              "Password",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const ChangePasswordTile(),
            const SizedBox(height: 10),
            const Text(
              "Forgot Password?",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
