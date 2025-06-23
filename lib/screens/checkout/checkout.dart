import 'package:flutter/material.dart';
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

class Checkout extends StatelessWidget {
  const Checkout({super.key});

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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/check-one.png'),
                  SizedBox(height: 20),
                  Text(
                    "Payment Confirmed",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        "Your reservation has been",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("confirmed", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
