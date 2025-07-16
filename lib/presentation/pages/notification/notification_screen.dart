import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Center(
        child: Text(
          'No notifications yet',
          style: AppTextStyle.h1,
        ),
      ),
    );
  }
}