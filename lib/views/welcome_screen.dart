import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    
    // Simulating a delay for splash screen
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed('/profilePage'); // Navigate to NavBar screen
    });

    return Scaffold(
      backgroundColor: const Color(0xff18112e),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 100),

                // Programmer image
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Image.asset('assets/programmer.png', height: 400),
                ),

                // Welcome text
                const Text(
                  'Hi Bitcube! \n Enjoy',
                  style: TextStyle(
                    color: Color(0xffefe9ce),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
