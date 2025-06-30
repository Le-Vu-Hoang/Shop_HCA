import 'package:e_commercial/core/enums/order_status.dart';

class OrderModel {
  final String id;
  final int cost;
  final int fee;
  final OrderStatus status;

  OrderModel({
    required this.id,
    required this.cost,
    required this.fee,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      cost: json['cost'] as int,
      fee: json['fee'] as int,
      status: OrderStatusExt.fromCode(json['status'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cost': cost,
      'fee': fee,
      'status': status.code,
    };
  }
}