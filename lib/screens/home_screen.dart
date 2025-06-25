import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/home/article_card.dart';
import '../components/home/product_card.dart';
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

final List<String> bikecycles = [
  'assets/bikecycle1.png',
  'assets/bikecycle2.png',
  'assets/bikecycle3.png',
  'assets/bikecycle4.png',
  'assets/bikecycle5.png',
  'assets/bikecycle6.png',
];

final List<String> electricbikes = [
  'assets/ebike1.png',
  'assets/ebike1.png',
  'assets/ebike1.png',
  'assets/ebike1.png',
];

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
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/home/angkor_wat.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  child: Text(
                    'Explore Siem Reap',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: -2,
                  bottom: -70,
                  child: Image.asset(
                    'assets/images/home/hero.png',
                    width: 180,
                    height: 240,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          Text(
            'Explore Our Mode of Transportation',
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              color: kMainThemeColor,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: TransportationCard(
                  title: 'Motorbike',
                  color: const Color(0xFFDA00FF),
                  imagePath: 'assets/images/home/motobike.png',
                  onTap: () => context.go('/home/browse', extra: motorbikes),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TransportationCard(
                  title: 'Bike',
                  color: const Color(0xFFFF3999),
                  imagePath: 'assets/images/home/bike.png',
                  onTap: () => context.go('/home/browse', extra: bikecycles),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TransportationCard(
                  title: 'Electric Bike',
                  color: const Color(0xFF0037FF),
                  imagePath: 'assets/images/home/electric_bike.png',
                  onTap: () => context.go('/home/browse', extra: electricbikes),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _buildSectionHeader(
            context,
            title: 'Trending Transportation',
            onSeeAll: () => context.goNamed('browse'),
          ),
          const SizedBox(height: 16),
          const ProductCard(
            name: 'TREK F1000',
            rating: 4.7,
            status: 'Available For Pickup',
            location: 'Pub Street (1.5km away)',
            imagePath: 'assets/images/home/bike1.png',
          ),
          const SizedBox(height: 16),
          const ProductCard(
            name: 'EVO S300',
            rating: 4.7,
            status: 'Reserved Only',
            location: 'Preah Dak (1km away)',
            imagePath: 'assets/images/home/bike2.png',
          ),

          const SizedBox(height: 24),

          _buildSectionHeader(
            context,
            title: 'Articles To Read',
            onSeeAll: () {},
          ),
          const SizedBox(height: 16),
          const ArticleCard(
            title:
                'Survivors, sniffing dogs join anti-mine march at Cambodia\'s Angkor Wat',
            imagePath: 'assets/images/home/article1.png',
          ),
          const SizedBox(height: 16),
          const ArticleCard(
            title:
                'Cycling in Angkor Wat: Essential Tips to Explore Angkor Wat by Bike',
            imagePath: 'assets/images/home/article2.png',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context,
      {required String title, required VoidCallback onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kMainThemeColor,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: Text(
            'See all',
            style: TextStyle(
              color: kMainThemeColor,
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class TransportationCard extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;
  final VoidCallback onTap;

  const TransportationCard({
    super.key,
    required this.title,
    required this.color,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
