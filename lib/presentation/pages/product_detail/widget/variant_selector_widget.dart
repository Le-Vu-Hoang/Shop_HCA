import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/presentation/widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../../../../core/utils/format_currency.dart';
import '../../../../domain/entities/product_detail.dart';
import '../../../../injection/injection_container.dart';
import '../../../blocs/product_detail/product_detail_cubit.dart';
import '../product_detail.dart';

class VariantSelectorWidget extends StatefulWidget {
  final ProductDetailEntity product;
  final VariantActionType actionType;

  const VariantSelectorWidget({
    super.key,
    required this.product,
    required this.actionType,
  });

  @override
  State<VariantSelectorWidget> createState() => _VariantSelectorWidgetState();
}

class _VariantSelectorWidgetState extends State<VariantSelectorWidget> {
  String? selectedVariantId;
  int quantity = 1;

  final TextEditingController _quantityController =
      TextEditingController(text: '1');

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void handleConfirm() {
    sl<Logger>().d('Clicked: $selectedVariantId, qty: $quantity');
    if (selectedVariantId != null) {
      context.read<ProductDetailCubit>().addToCart(
            selectedVariantId!,
            quantity,
            widget.product.imageProducts.first,
          );
      if (widget.actionType == VariantActionType.addCart) {
        Navigator.pop(context);
      } else if (widget.actionType == VariantActionType.buyNow) {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/payment');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final variants = widget.product.productVariants;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            const SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.product.imageProducts.first,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              formatCurrency(widget.product.averagePrice),
              style: AppTextStyle.withColor(
                  AppTextStyle.subtitle, Colors.redAccent),
              overflow: TextOverflow.ellipsis,
            ),
          ]),
          const SizedBox(height: 6),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phân loại',
                style: AppTextStyle.withWeight(
                  AppTextStyle.subtitle,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: variants.map((variant) {
                final isSelected = selectedVariantId == variant.id;
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedVariantId = variant.id);
                    sl<Logger>().d('Selected variant: $selectedVariantId');
                    },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? Colors.redAccent
                            : Colors.grey.shade300,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? Colors.white : Colors.grey.shade100,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        variant.name,
                        style: AppTextStyle.withColor(AppTextStyle.textLarge,
                            isSelected ? Colors.redAccent : Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Số lượng',
                  style: AppTextStyle.withColor(
                      AppTextStyle.subtitle, Colors.black),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: quantity > 1
                          ? () {
                              setState(() {
                                quantity--;
                                _quantityController.text = quantity.toString();
                                sl<Logger>().d('Quantity changed: $quantity');
                              });
                            }
                          : null,
                    ),
                    SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        width: 40,
                        child: TextField(
                          controller: _quantityController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: (value) {
                            final val = int.tryParse(value);
                            if (val != null && val > 0) {
                              setState(() => quantity = val);
                              sl<Logger>().d('Quantity changed: $quantity');
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                          _quantityController.text = quantity.toString();
                          sl<Logger>().d('Quantity changed: $quantity');
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          AppButton(
              text: widget.actionType == VariantActionType.addCart
                  ? 'Thêm vào giỏ hàng'
                  : 'Mua ngay',
              color: AppThemes.primaryColor,
              textStyle: AppTextStyle.withColor(
                  AppTextStyle.buttonLarge, Colors.white),
              onPressed: () {
                if (selectedVariantId != null) handleConfirm();
              },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
