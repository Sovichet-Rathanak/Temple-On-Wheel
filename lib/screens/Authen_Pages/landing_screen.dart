import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temple_on_wheel/constants/theme.dart';

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
            children: [
              const Spacer(),

              // Main illustration - larger
              GestureDetector(
                onTap: () {
                  print('Landing image tapped');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 2,
                  height: MediaQuery.of(context).size.width * .7,
                  child: Image.asset('assets/landing.png', fit: BoxFit.contain),
                ),
              ),

              const SizedBox(height: 40),

              // Title aligned to start
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Temple\nOn\nWheels',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 48,
                    fontFamily: "ClimateCrisis",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.1,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Subtitle aligned to start
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ride through the heart of Siem Reap and uncover its hidden wonders.',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    height: 1.4,
                  ),
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
                    backgroundColor: kMainThemeColor,
                    foregroundColor: kSecondaryThemeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Start Your Journey',
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
