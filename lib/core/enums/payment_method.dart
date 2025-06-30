enum PaymentMethod {
  op, // Online Payment
  cod, // Cash on Delivery
}

extension PaymentMethodExt on PaymentMethod {
  String get code {
    switch (this) {
      case PaymentMethod.op:
        return 'OP';
      case PaymentMethod.cod:
        return 'COD';
    }
  }
}