import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Main illustration - clickable but no navigation
              GestureDetector(
                onTap: () {
                  // Image is clickable but doesn't navigate anywhere
                  print('Landing image tapped');
                },
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'assets/landing.png',
                    width: 300,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Title
              const Text(
                'Temple\nOn\nWheels',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.1,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Subtitle
              const Text(
                'Ride through the heart of Siem Reap and uncover its hidden wonders.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
              
              const Spacer(),
              
              // Start Your Journey Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/onboarding');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D5A3D),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Start Your Journey',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
