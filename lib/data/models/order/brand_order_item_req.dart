class BrandOrderItem {
  final String variantId;
  final String amount;
  final String cost;

  BrandOrderItem({
    required this.variantId,
    required this.amount,
    required this.cost,
  });

  Map<String, dynamic> toJson() => {
    "variant_id": variantId,
    "amount": amount,
    "cost": cost,
  };
}