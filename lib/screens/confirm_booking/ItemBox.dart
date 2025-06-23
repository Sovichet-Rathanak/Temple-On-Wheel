import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/constants/theme.dart';

class ItemBox extends StatelessWidget {
  final String imagePath;

  const ItemBox({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     SizedBox(width: 10),

            //     Icon(Icons.arrow_back, color: Colors.black, size: 20),
            //     SizedBox(width: 5),
            //     Text(
            //       'Back',
            //       style: TextStyle(color: Colors.black, fontSize: 16),
            //     ),
            //   ],
            // ),
            SizedBox(height: 10),

            Text(
              "   Your Reservation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ],
        ),

        SizedBox(height: 10),

        Row(
          children: [
            Image.asset(imagePath, width: 100, height: 100),

            SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Eleglide T1 Electric mountain bike',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Offer By: Aria Renting',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 5),

                Text(
                  'Pick Up/Checkout Date',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                SizedBox(height: 10),

                Button(),
              ],
            ),

            SizedBox(width: 20),

            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF144434),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      context.goNamed('qr_code');
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                      fixedSize: WidgetStateProperty.all(Size(80, 15)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Image.asset(
                      'assets/bakong_logo.png',
                      // height: 100,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 10),
          ],
        ),

        Divider(color: Color(0x40000000), thickness: 1),
        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(kMainThemeColor),
              ),
              onPressed: () {
                context.goNamed('qr_code');
              },
              child: Text(
                'Pay on Pickup',
                style: TextStyle(
                  color: kSecondaryThemeColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int num = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMainThemeColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            iconSize: 18,
            padding: EdgeInsets.all(4),
            constraints: BoxConstraints.tight(Size(30, 30)),
            onPressed: () {
              setState(() {
                if (num > 1) num -= 1;
              });
            },
            icon: Icon(Icons.remove, color: Colors.white, size: 12),
          ),

          Text(
            num.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          IconButton(
            iconSize: 18,
            padding: EdgeInsets.all(4),
            constraints: BoxConstraints.tight(Size(30, 30)),
            onPressed: () {
              setState(() {
                num += 1;
              });
            },
            icon: Icon(Icons.add, color: Colors.white, size: 12),
          ),
        ],
      ),
    );
  }
}
