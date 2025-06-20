import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/home/article_card.dart';
import '../components/home/product_card.dart';
import 'package:temple_on_wheel/constants/theme.dart';
import 'package:temple_on_wheel/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Temple\nOn Wheels',
          softWrap: true,
          style: TextStyle(
            color: kMainThemeColor,
            fontFamily: "ClimateCrisis",
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/home/angkor_wat.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: -2,
                  bottom: -70,
                  child: Container(
                    width: 180,
                    height: 240,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/home/hero.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 30,
                  child: Text(
                    'Explore Siem Reap',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Transportation Mode Section with updated color
          Row(
            children: [
              Text(
                'Explore Our Mode of Transportation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kMainThemeColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed('browse');
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: kMainThemeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Updated taller transportation cards with bigger images
          Row(
            children: [
              Expanded(
                child: TransportationCard(
                  title: 'Motorbike',
                  color: const Color(0xFFDA00FF),
                  imagePath: 'assets/images/home/motobike.png',
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: TransportationCard(
                  title: 'Bike',
                  color: const Color(0xFFFF3999),
                  imagePath: 'assets/images/home/bike.png',
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: TransportationCard(
                  title: 'Electric Bike',
                  color: const Color(0xFF0037FF),
                  imagePath: 'assets/images/home/electric_bike.png',
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Trending Transportation Section
          Text(
            'Trending Transportation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kMainThemeColor,
            ),
          ),

          const SizedBox(height: 16),

          // Product Cards
          ProductCard(
            name: 'TREK F1000',
            rating: 4.7,
            status: 'Available For Pickup',
            location: 'Pub Street (1.5km away)',
            imagePath: 'assets/images/home/bike1.png',
          ),

          const SizedBox(height: 16),

          ProductCard(
            name: 'EVO S300',
            rating: 4.7,
            status: 'Reserved Only',
            location: 'Preah Dak (1km away)',
            imagePath: 'assets/images/home/bike2.png',
          ),

          const SizedBox(height: 24),

          // Articles Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Articles To Read',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kMainThemeColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  print('See all articles pressed');
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: kMainThemeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Article Cards
          ArticleCard(
            title:
                'Survivors, sniffing dogs join anti-mine march at Cambodia\'s Angkor Wat',
            imagePath: 'assets/images/home/article1.png',
          ),

          const SizedBox(height: 16),

          ArticleCard(
            title:
                'Cycling in Angkor Wat: Essential Tips to Explore Angkor Wat by Bike',
            imagePath: 'assets/images/home/article2.png',
          ),
        ],
      ),
    );
  }
}

class TransportationCard extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;

  const TransportationCard({
    Key? key,
    required this.title,
    required this.color,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160, // Taller card
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Title positioned at top left with larger font size
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18, // Increased from 14 to 18
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Image positioned exactly at bottom right corner
          Positioned(
            bottom: 0, // Positioned at the very bottom
            right: 0, // Positioned at the very right
            child: Container(
              width: 100, // Slightly larger image
              height: 100, // Slightly larger image
              decoration: BoxDecoration(
                image: DecorationImage(
                  // TODO: Replace with your transportation mode image
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
