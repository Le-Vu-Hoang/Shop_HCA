class AddressModel {
  final String id;
  final String address;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.address,
    required this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as String,
      address: json['address'] as String,
      isDefault: json['is_default'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'is_default': isDefault,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'address': address,
      'is_default': isDefault,
    };
  }

}