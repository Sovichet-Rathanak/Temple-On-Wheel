import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/constants/theme.dart';

class Browse extends StatelessWidget {
  final List data;

  const Browse({super.key, required this.data});

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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Filter By',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  Column(
                    children: List.generate(
                      data.length,
                      (index) => ItemBox(imagePath: data[index]),
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

class ItemBox extends StatelessWidget {
  final String imagePath;

  const ItemBox({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(imagePath, width: 100, height: 100),

            SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Yamaha Delight',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.star, color: Colors.orange, size: 10),
                    Text(
                      '4.7',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),

                SizedBox(height: 5),

                Row(
                  children: [
                    Icon(Icons.location_on, size: 15),

                    Text(
                      'Pub Street',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),

                Text(
                  ' (500m away)',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
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
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      context.goNamed('detail');
                    },
                    child: Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Text(
                    'Available for Pickup',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ),

            SizedBox(width: 10),
          ],
        ),

        Divider(color: Color(0x40000000), thickness: 1),
      ],
    );
  }
}
