import '../../core/enums/order_status.dart';

class OrderEntity {
  final String id;
  final int cost;
  final int fee;
  final String status;

  OrderEntity({
    required this.id,
    required this.cost,
    required this.fee,
    required this.status,
  });
}