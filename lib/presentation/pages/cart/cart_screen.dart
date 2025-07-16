import 'package:auto_route/annotations.dart';
import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/format_currency.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/cart/cart_event.dart';
import '../../blocs/cart/cart_state.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc()..add(GetCartItems()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppThemes.primaryColor,
                      size: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Giỏ hàng',
                    style: AppTextStyle.withColor(
                        AppTextStyle.subtitle, Colors.black),
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(
                        Icons.messenger_outline,
                        color: AppThemes.primaryColor,
                        size: 24,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartError) {
              return Center(
                child: Text(
                  'Lỗi: ${state.message}',
                  style: AppTextStyle.withColor(
                    AppTextStyle.subtitle,
                    Colors.redAccent,
                  ),
                ),
              );
            } else if (state is CartUpdated) {
              final cartItems = state.cartItems;
              final selectedItems = state.selectedItems;

              final allItems = cartItems.expand((b) => b.items).toList();
              final allSelected = allItems.isNotEmpty &&
                  allItems.every((i) =>
                      selectedItems.any((s) => s.variantId == i.variantId));

              return Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade100,
                      child: ListView.separated(
                        itemCount: cartItems.length,
                        separatorBuilder: (_, __) =>
                            const Divider(thickness: 1),
                        itemBuilder: (context, brandIndex) {
                          final brand = cartItems[brandIndex];
                          final brandSelected = brand.items.every((i) =>
                              selectedItems
                                  .any((s) => s.variantId == i.variantId));

                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: brandSelected,
                                      onChanged: (val) {
                                        context.read<CartBloc>().add(
                                              ToggleBrandSelection(
                                                  brand.brandId, val ?? false),
                                            );
                                      },
                                    ),
                                    Text(
                                      brand.brandName,
                                      style: AppTextStyle.subtitle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 8),
                                    const Expanded(
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                ...brand.items.map((item) {
                                  final isSelected = selectedItems.any(
                                      (s) => s.variantId == item.variantId);

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 2),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                          value: isSelected,
                                          onChanged: (_) {
                                            context.read<CartBloc>().add(
                                                  ToggleVariantSelection(
                                                      item.variantId),
                                                );
                                          },
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            item.imageLink,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(item.productVariant.name,
                                                  style: AppTextStyle.withColor(
                                                      AppTextStyle.subtitle,
                                                      Colors.black)),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      formatCurrency(item
                                                          .productVariant
                                                          .price),
                                                      style: AppTextStyle
                                                          .withColor(
                                                              AppTextStyle
                                                                  .textLarge,
                                                              AppThemes
                                                                  .primaryColor),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                      CartBloc>()
                                                                  .add(
                                                                    DecreaseProductQuantity(
                                                                        item.variantId),
                                                                  );
                                                            },
                                                            child: Center(
                                                              child: Icon(
                                                                  Icons.remove,
                                                                  size: 16),
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        width: 32,
                                                        child: Text(
                                                          item.amount
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: AppTextStyle
                                                              .withColor(
                                                                  AppTextStyle
                                                                      .textLarge,
                                                                  Colors.black),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            context
                                                                .read<
                                                                    CartBloc>()
                                                                .add(
                                                                  IncreaseProductQuantity(
                                                                      item.variantId),
                                                                );
                                                          },
                                                          child: Center(
                                                            child: Icon(
                                                                Icons.add,
                                                                size: 16),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            final bloc = context.read<CartBloc>();
            final allItems = state is CartUpdated
                ? state.cartItems.expand((b) => b.items).toList()
                : [];
            final selectedItems = bloc.selectedItems;

            final allSelected = allItems.isNotEmpty &&
                allItems.every((i) =>
                    selectedItems.any((s) => s.variantId == i.variantId));

            final total = selectedItems.fold<int>(
              0,
              (sum, i) => sum + i.amount * i.productVariant.price,
            );

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  Checkbox(
                    value: allSelected,
                    onChanged: (val) {
                      context
                          .read<CartBloc>()
                          .add(ToggleAllVariantsSelection(val ?? false));
                    },
                  ),
                  const Text("Chọn tất cả"),
                  const Spacer(),
                  Text(
                    formatCurrency(total),
                    style: AppTextStyle.withColor(
                        AppTextStyle.subtitle, AppThemes.primaryColor),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: selectedItems.isEmpty ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppThemes.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                    ),
                    child: Text('Mua ngay',
                        style: AppTextStyle.withColor(
                            AppTextStyle.subtitle, Colors.white)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
