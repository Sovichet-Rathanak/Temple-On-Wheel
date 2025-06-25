import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/constants/theme.dart';

class Browse extends StatelessWidget {
  final List data;

  const Browse({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainThemeColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kMainThemeColor,
            expandedHeight: 120,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final isCollapsed = constraints.maxHeight <= kToolbarHeight;

                return FlexibleSpaceBar(
                  titlePadding: const EdgeInsetsDirectional.only(
                    start: 16,
                    bottom: 12,
                  ),
                  centerTitle: false,
                  title: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child:
                        isCollapsed
                            ? Text(
                              'Temple On Wheels',
                              key: const ValueKey('collapsed'),
                              style: TextStyle(
                                fontFamily: "ClimateCrisis",
                                color: kSecondaryThemeColor,
                                fontSize: 18,
                              ),
                            )
                            : Column(
                              key: const ValueKey('expanded'),
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temple',
                                  style: TextStyle(
                                    fontFamily: "ClimateCrisis",
                                    color: kSecondaryThemeColor,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'On Wheels',
                                  style: TextStyle(
                                    fontFamily: "ClimateCrisis",
                                    color: kSecondaryThemeColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                  ),
                  background: Container(color: kMainThemeColor),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 22),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                        SizedBox(width: 5),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildFilterSection(context),
                  const SizedBox(height: 10),
                  _buildItemList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: const Row(
              children: [
                Text(
                  'Filter By',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Inter",
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
          ),
        ),
      ],
    );
  }

  Widget _buildItemList() {
    return Column(
      children: List.generate(
        data.length,
        (index) => ItemBox(imagePath: data[index]),
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
            _buildItemImage(),
            const SizedBox(width: 10),
            _buildItemDetails(),
            const SizedBox(width: 20),
            _buildBookingSection(context),
            const SizedBox(width: 10),
          ],
        ),
        const Divider(color: Color(0x40000000), thickness: 1),
      ],
    );
  }

  Widget _buildItemImage() {
    return Image.asset(imagePath, width: 100, height: 100);
  }

  Widget _buildItemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Yamaha Delight',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(width: 5),
            Icon(Icons.star, color: Colors.orange, size: 10),
            Text('4.7', style: TextStyle(color: Colors.black, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: const [
            Icon(Icons.location_on, size: 15),
            Text(
              'Pub Street',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
        const Text(
          ' (500m away)',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildBookingSection(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF144434),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () => context.goNamed('detail'),
            child: const Text(
              'Book Now',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const Text(
            'Available for Pickup',
            style: TextStyle(color: Colors.black, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
