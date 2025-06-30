import 'package:e_commercial/core/enums/order_status.dart';

import '../../../domain/entities/order.dart';
import 'order_model.dart';

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      cost : cost,
      fee: fee,
      status: status.code,
    );
  }
}