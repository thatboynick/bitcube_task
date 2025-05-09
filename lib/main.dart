import 'package:bitcube_task/views/profile/profile_page.dart';
import 'package:bitcube_task/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const NickBaloi());
}

class NickBaloi extends StatefulWidget {
  const NickBaloi({super.key});

  @override
  State<NickBaloi> createState() => _NickBaloiState();
}

class _NickBaloiState extends State<NickBaloi> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route
      getPages: [
        GetPage(name: '/', page: () => const SplashView()), // Define the splash view
        GetPage(name: '/profilePage', page: () => ProfilePage()), // Define the profile page
      ],
    );
  }
}