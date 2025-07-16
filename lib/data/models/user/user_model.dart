import 'package:e_commercial/domain/entities/address.dart';

import '../address/address_model.dart';

class UserModel {
  final String id;
  final String? imageLink;
  final String? fullName;
  final String accountName;
  final String? birthday;
  final String email;
  final String? numberPhone;
  final bool isLocked;
  final List<AddressEntity> addresses;

  UserModel({
    required this.id,
    this.imageLink,
    this.fullName,
    required this.accountName,
    this.birthday,
    required this.email,
    this.numberPhone,
    required this.isLocked,
    List<AddressEntity>? addresses,
  }) : addresses = addresses ?? [];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      imageLink: json['image_link'] as String?,
      fullName: json['full_name'] as String?,
      accountName: json['account_name'] as String,
      birthday: json['birthday'] as String?,
      email: json['email'] as String,
      numberPhone: json['numberphone'] as String?,
      isLocked: json['is_locked'] as bool,
      addresses: (json['shipping_address'] as List<dynamic>?)
          ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>) as AddressEntity)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_link': imageLink,
      'full_name': fullName,
      'account_name': accountName,
      'birthday': birthday,
      'email': email,
      'numberphone': numberPhone,
      'is_locked': isLocked,
      'shipping_address': addresses,
    };
  }


  UserModel copyWith({
    String? fullName,
    String? accountName,
    String? email,
    String? birthday,
    String? numberPhone,
    String? imageLink,
    String? id,
    bool? isLocked,
    List<AddressEntity>? addresses,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      accountName: accountName ?? this.accountName,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      numberPhone: numberPhone ?? this.numberPhone,
      imageLink: imageLink ?? this.imageLink,
      isLocked: isLocked ?? this.isLocked,
      addresses: addresses ?? this.addresses,
    );
  }
}