enum OrderStatus {
  pending,
  processing,
  completed,
  cancelled,
  refunded,
  failed,
  onHold,
  shipped,
  delivered,
  returned
}

extension OrderStatusExt on OrderStatus {
  String get code {
    switch (this) {
      case OrderStatus.pending:
        return 'PENDING';
      case OrderStatus.processing:
        return 'PROCESSING';
      case OrderStatus.completed:
        return 'COMPLETED';
      case OrderStatus.cancelled:
        return 'CANCELLED';
      case OrderStatus.refunded:
        return 'REFUNDED';
      case OrderStatus.failed:
        return 'FAILED';
      case OrderStatus.onHold:
        return 'ON_HOLD';
      case OrderStatus.shipped:
        return 'SHIPPED';
      case OrderStatus.delivered:
        return 'DELIVERED';
      case OrderStatus.returned:
        return 'RETURNED';
    }
  }

  static OrderStatus fromCode(String code) {
    switch (code.toUpperCase()) {
      case 'PENDING':
        return OrderStatus.pending;
      case 'PROCESSING':
        return OrderStatus.processing;
      case 'COMPLETED':
        return OrderStatus.completed;
      case 'CANCELLED':
        return OrderStatus.cancelled;
      case 'REFUNDED':
        return OrderStatus.refunded;
      case 'FAILED':
        return OrderStatus.failed;
      case 'ON_HOLD':
        return OrderStatus.onHold;
      case 'SHIPPED':
        return OrderStatus.shipped;
      case 'DELIVERED':
        return OrderStatus.delivered;
      case 'RETURNED':
        return OrderStatus.returned;
      default:
        throw Exception('Unknown order status: $code');
    }
  }
}
