import 'package:auto_route/annotations.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_text_style.dart';
import '../../blocs/category/category_cubit.dart';
import '../../blocs/category/category_state.dart';

@RoutePage()
class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Shop By Categories',
            style: AppTextStyle.withColor(AppTextStyle.h1, Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white, size: 32),
          backgroundColor: AppThemes.backgroundColor,
          centerTitle: false,
        ),
        body: Container(
          color: AppThemes.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: _categories())],
          ),
        ),
      ),
    );
  }

  Widget _categories() {
    return BlocBuilder<CategoryDisplayCubit, CategoryDisplayState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryLoaded) {
          return ListView.separated(
            itemCount: state.categories.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              category.imageLink ??
                                  "https://hoseiki.vn/wp-content/uploads/2025/03/anh-gai-cute-24.jpg?v=1741738082",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        category.categoryName,
                        style: AppTextStyle.withWeight(AppTextStyle.textLarge, FontWeight.w600)
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox(); // fallback khi chưa có state
      },
    );
  }
}
