import 'package:flutter/material.dart';
import 'package:temple_on_wheel/screens/confirm_booking/ItemBox.dart';
import 'package:temple_on_wheel/constants/theme.dart';

final List<String> motorbikes = [
  'assets/motorbike1.png',
  'assets/motorbike1.png',
  'assets/motorbike2.png',
  'assets/motorbike2.png',
  'assets/motorbike3.png',
  'assets/motorbike3.png',
  'assets/motorbike1.png',
];

class ConfirmBooking extends StatelessWidget {
  const ConfirmBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // leading: Text(""),
            backgroundColor: kMainThemeColor,
            centerTitle: false,
            expandedHeight: 100,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(color: kMainThemeColor),
              title: Text(
                "Temple On Wheels",
                style: TextStyle(
                  fontFamily: "ClimateCrisis",
                  color: kSecondaryThemeColor,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: ItemBox(imagePath: motorbikes[0])),
        ],
      ),
    );
  }
}
