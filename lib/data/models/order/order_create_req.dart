import '../../../core/enums/payment_method.dart';
import 'brand_order_req.dart';

class OrderReqParams {
  final List<BrandOrder> list;
  final PaymentMethod method;

  OrderReqParams({
    required this.list,
    required this.method,
  });

  Map<String, dynamic> toJson() => {
    'list': list.map((e) => e.toJson()).toList(),
    'method': method.code,
  };
}
