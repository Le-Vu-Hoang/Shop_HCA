import 'dart:convert';

class CreateAddressReqParams {
  final String address;
  final bool isDefault;

  CreateAddressReqParams({
    required this.address,
    required this.isDefault,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'address': address,
      'is_default': isDefault,
    };
  }

  String toJson() => json.encode(toMap());
}