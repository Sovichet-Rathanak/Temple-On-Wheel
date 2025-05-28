import 'package:flutter/material.dart';
import 'package:temple_on_wheel/components/AccountComponents/SettingBaseAppbar.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingBaseAppBar(title: "General", appBar: AppBar()),
      body: SafeArea(
        child: ListView(padding: EdgeInsets.all(16),children: [Text("Account Details")]),
      ),
    );
  }
}
