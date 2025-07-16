
import 'package:auto_route/annotations.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/presentation/pages/home/widgets/category_list.dart';
import 'package:e_commercial/presentation/pages/home/widgets/new_in.dart';
import 'package:e_commercial/presentation/pages/home/widgets/top_selling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/header/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppThemes.backgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8,),
                const Header(),
                const SizedBox(height: 12),
                CategoryList(),
                const SizedBox(height: 16),
                TopSelling(),
                const SizedBox(height: 32),
                NewIn(),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
