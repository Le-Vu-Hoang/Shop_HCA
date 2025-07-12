import 'package:e_commercial/domain/entities/category.dart';
import 'package:e_commercial/presentation/widgets/loading/app_loading.dart';
import 'package:e_commercial/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/constants/app_text_style.dart';
import '../../../../injection/injection_container.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../blocs/category/category_cubit.dart';
import '../../../blocs/category/category_state.dart';
import '../../product/product_screen.dart';


class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    // Gọi sự kiện fetch data ngay sau build
    Future.microtask(() {
      final cubit = context.read<CategoryDisplayCubit>();
      if (cubit.state is! CategoryLoaded) {
        cubit.displayCategories();
      }
    });

    return BlocListener<CategoryDisplayCubit, CategoryDisplayState>(
      listener: (context, state) {
        if (state is CategoryLoading) {
          AppLoading.show(context);
        } else {
          AppLoading.hide(context);
        }

        if (state is LoadCategoryFailure) {
          Fluttertoast.showToast(
            msg: state.errorMessage,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      child: BlocBuilder<CategoryDisplayCubit, CategoryDisplayState>(
        builder: (context, state) {
          if (state is CategoryLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _viewAll(),
                const SizedBox(height: 5),
                _categoriesView(state.categories),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _viewAll() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categories',
          style: AppTextStyle.withColor(AppTextStyle.subtitle, Colors.white),
        ),
        TextButton(
          onPressed: () {
            sl<AppRouter>().push(const AllCategoriesRoute());
          },
          child: Text(
            'View All',
            style: AppTextStyle.withColor(AppTextStyle.subtitle, Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _categoriesView(List<CategoryEntity> categories) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  sl<AppRouter>().push(ProductRoute(categoryId: categories[index].id));
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    categories[index].imageLink ??
                        "https://hoseiki.vn/wp-content/uploads/2025/03/anh-gai-cute-24.jpg?v=1741738082",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 80,
                child: Text(
                  categories[index].categoryName,
                  style: AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(width: 15),
      ),
    );
  }
}
