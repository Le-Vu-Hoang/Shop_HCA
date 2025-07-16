import 'package:e_commercial/domain/entities/address.dart';

class AddressModel {
  final String id;
  final String address;
  final String ward;
  final String city;
  final String country;
  final String zipCode;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.address,
    required this.ward,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as String,
      address: json['address'] as String,
      ward: json['ward'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      zipCode: json['zip_code'] as String,
      isDefault: json['is_default'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'ward': ward,
      'city': city,
      'country': country,
      'zip_code': zipCode,
      'is_default': isDefault,
    };
  }

  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      id: entity.id,
      address: entity.address,
      ward: entity.ward,
      city: entity.city,
      country: entity.country,
      zipCode: entity.zipCode,
      isDefault: entity.isDefault,
    );
  }

  Map<String, dynamic> toMap() => toJson();
}