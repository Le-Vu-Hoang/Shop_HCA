import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/routes/app_router.dart';
import 'package:e_commercial/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../core/utils/format_currency.dart';
import '../../../../injection/injection_container.dart';
import '../../../blocs/product/product_bloc.dart';
import '../../../blocs/product/product_event.dart';
import '../../../blocs/product/product_state.dart';

class ProductListView extends StatelessWidget {
  final ProductState state;

  const ProductListView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (!state.isLoadingMore &&
            state.hasMore &&
            scrollInfo.metrics.pixels >=
                scrollInfo.metrics.maxScrollExtent - 100) {
          context.read<ProductBloc>().add(LoadMoreProducts());
        }
        return false;
      },
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 0.6,
        ),
        itemCount: state.products.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < state.products.length) {
            final product = state.products[index];
            return GestureDetector(
              onTap: () {
                sl<AppRouter>().push(ProductDetailRoute(productId: product.id));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        child: Image.network(
                          product.imageProducts[0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: AppTextStyle.withWeight(
                            AppTextStyle.textLarge, FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 4, right: 8, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.yellow[800]!,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_outline_sharp,
                                  color: Colors.yellow[800],
                                  size: 24,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '5.0',
                                  style: AppTextStyle.withColor(
                                      AppTextStyle.subtitle, Colors.black),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      child: Text(
                        formatCurrency(product.averagePrice).toString(),
                        style: AppTextStyle.withWeight(
                            AppTextStyle.textLarge, FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                  child: Text(
                'Không tìm thấy sản phẩm',
                style:
                    AppTextStyle.withColor(AppTextStyle.subtitle, Colors.white),
              )),
            );
          }
        },
      ),
    );
  }
}
