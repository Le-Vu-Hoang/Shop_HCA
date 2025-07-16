import 'dart:convert';

class AddCartReqParams {
  final String variantId;
  final int quantity;
  final String image;

  AddCartReqParams({
    required this.variantId,
    required this.quantity,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'list': [
        {
          'id': variantId,
          'amount': quantity,
          'image_link': image,
        }
      ]
    };
  }

  String toJson() => json.encode(toMap());
}