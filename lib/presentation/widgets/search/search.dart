import 'package:flutter/material.dart';

import '../../../core/constants/app_text_style.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          hintText: 'Search...',
          hintStyle: AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.white),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}