import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

class QRCode extends StatelessWidget {
  const QRCode({super.key});

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
              height: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/qr-code.png'),

                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kMainThemeColor),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      ),
                    ),
                    onPressed: () {
                      context.goNamed('checkout');
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
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
