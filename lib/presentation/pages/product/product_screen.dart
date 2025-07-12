import 'package:auto_route/annotations.dart';
import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/presentation/blocs/sub_category/sub_category_cubit.dart';
import 'package:e_commercial/presentation/blocs/sub_category/sub_category_state.dart';
import 'package:e_commercial/presentation/pages/product/widget/product_list_view.dart';
import 'package:e_commercial/presentation/pages/product/widget/subcategory_list.dart';
import 'package:e_commercial/presentation/widgets/loading/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/product_bloc.dart';
import '../../blocs/product/product_event.dart';
import '../../blocs/product/product_state.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  final String? categoryId;

  const ProductScreen({super.key, this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 32),
          backgroundColor: AppThemes.primaryColor,
          title: Text(
            "Products",
            style: AppTextStyle.withColor(AppTextStyle.h1, Colors.white),
          )),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (_) => ProductBloc()
              ..add(categoryId != null
                  ? FetchProductsByFilter(categoryId!)
                  : FetchProducts()),
          ),
          BlocProvider<SubCategoryDisplayCubit>(
              create: (_) =>
                  SubCategoryDisplayCubit(categoryId)..displaySubCategory()),
        ],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppThemes.backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              BlocConsumer<SubCategoryDisplayCubit, SubCategoryState>(
                  listener: (context, state) {
                if (state is SubCategoryLoading) {
                  AppLoading.show(context);
                } else {
                  AppLoading.hide(context);
                }
              }, builder: (context, state) {
                if (state is SubCategoryLoaded) {
                  return SubCategoryList(subCategories: state.subCategories);
                }
                if (state is SubCategoryFailed) {
                  return Center(
                    child: Text(
                      state.error,
                      style: AppTextStyle.withColor(
                          AppTextStyle.subtitle, Colors.red),
                    ),
                  );
                }
                return const SizedBox(
                  height: 10,
                );
              }),
              const SizedBox(height: 10),
              Expanded(child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                return ProductListView(
                  state: state,
                );
              })),
            ],
          ),
        ),
      ),
    );
  }
}
