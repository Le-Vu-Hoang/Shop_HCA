import 'package:auto_route/annotations.dart';
import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/core/utils/format_currency.dart';
import 'package:e_commercial/presentation/widgets/loading/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../blocs/product_detail/product_detail_cubit.dart';
import '../../blocs/product_detail/product_detail_state.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white, size: 32),
      ),
      body: BlocProvider(
        create: (context) => ProductDetailCubit(productId)..loadProduct(),
        child: BlocListener<ProductDetailCubit, ProductDetailState>(
          listener: (context, state) {
            if (state is ProductDetailLoading) {
              AppLoading.show(context);
            } else {
              AppLoading.hide(context);
            }

            if (state is ProductDetailError) {
              Fluttertoast.showToast(
                msg: state.errorMessage,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          },
          child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailLoaded) {
                final product = state.product;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.zero,
                        child: Image.network(
                          product.imageProducts.first,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: AppTextStyle.withWeight(
                                  AppTextStyle.h1, FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.amber[700], size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  '5.0',
                                  style: AppTextStyle.withWeight(
                                      AppTextStyle.textLarge, FontWeight.w500),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '(128 đánh giá)',
                                  style: AppTextStyle.withColor(
                                      AppTextStyle.textLarge, Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              formatCurrency(product.averagePrice),
                              style: AppTextStyle.withColor(
                                  AppTextStyle.subtitle, Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Mô tả sản phẩm',
                          style: AppTextStyle.withWeight(
                              AppTextStyle.subtitle, FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          product.description,
                          style: AppTextStyle.withColor(
                              AppTextStyle.textLarge, Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  // TODO: Toggle yêu thích
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: Icon(Icons.favorite_border, color: Color(0xFFDA5C9D), size: 28),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6C63FF),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  padding: const EdgeInsets.symmetric(vertical: 22),
                ),
                onPressed: () {
                  // TODO: Add to cart
                },
                child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 28),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1ABC9C),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  padding: const EdgeInsets.symmetric(vertical: 22),
                ),
                onPressed: () {
                  // TODO: Buy now
                },
                child: const Icon(Icons.shopping_bag, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
