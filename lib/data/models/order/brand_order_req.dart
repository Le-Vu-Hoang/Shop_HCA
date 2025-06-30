import 'brand_order_item_req.dart';

class BrandOrder {
  final String brandId;
  final List<BrandOrderItem> list;
  final String cost;
  final int fee;

  BrandOrder({
    required this.brandId,
    required this.list,
    required this.cost,
    required this.fee,
  });

  Map<String, dynamic> toJson() => {
    'brand_id': brandId,
    'list': list.map((e) => e.toJson()).toList(),
    'cost': cost,
    'fee': fee,
  };
}