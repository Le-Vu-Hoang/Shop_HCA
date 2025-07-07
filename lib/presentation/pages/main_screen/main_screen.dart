import 'package:auto_route/annotations.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import '../cart/cart_screen.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CartScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: BottomBar(
          body: (context, controller) => _pages[currentIndex],
          showIcon: false,
          barColor: Color(0xFFFFF8E1),
          borderRadius: BorderRadius.circular(20),
          offset: 16,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => setState(() => currentIndex = 0),
                  child: Icon(Icons.home, color: currentIndex == 0 ? AppThemes.primaryColor : Colors.grey, size: 30),
                ),
                GestureDetector(
                  onTap: () => setState(() => currentIndex = 1),
                  child: Icon(Icons.shopping_cart, color: currentIndex == 1 ? AppThemes.primaryColor : Colors.grey, size: 30),
                ),
                GestureDetector(
                  onTap: () => setState(() => currentIndex = 2),
                  child: Icon(Icons.chat, color: currentIndex == 2 ? AppThemes.primaryColor : Colors.grey, size: 30),
                ),
                GestureDetector(
                  onTap: () => setState(() => currentIndex = 3),
                  child: Icon(Icons.person, color: currentIndex == 3 ? AppThemes.primaryColor : Colors.grey, size: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
