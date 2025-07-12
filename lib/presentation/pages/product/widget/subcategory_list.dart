import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/domain/entities/sub_category.dart';
import 'package:flutter/material.dart';

class SubCategoryList extends StatelessWidget {
  final List<SubCategoryEntity>? subCategories;

  const SubCategoryList({
    super.key,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    if ( subCategories == null ) {
      return const SizedBox(
        height: 10,
      );
    } else {
      return SizedBox(
        height: 35,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: subCategories!.length,
          itemBuilder: (context, index) {
            final subCategory = subCategories?[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  width: 1,
                  color: AppThemes.fitText,
                )
              ),
              child: Text(subCategory!.name,
                style: AppTextStyle.withWeight(AppTextStyle.textLarge, FontWeight.w600),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 15),
        ),
      );
    }
  }
}
