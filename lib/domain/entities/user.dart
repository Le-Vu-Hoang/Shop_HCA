import 'address.dart';

class UserEntity {
  final String id;
  final String? imageLink;
  final String? fullName;
  final String accountName;
  final String? birthday;
  final String email;
  final String? numberPhone;
  final bool isLocked;
  final List<AddressEntity> addresses;

  UserEntity({
    required this.id,
    this.imageLink,
    this.fullName,
    required this.accountName,
    this.birthday,
    required this.email,
    this.numberPhone,
    required this.isLocked,
    required this.addresses,
  });
}

// "id": "USER-0f1e0b33",
// "image_link": null,
// "full_name": null,
// "account_name": "haocao",
// "birthday": null,
// "email": "hao@fmail.com",
// "numberphone": null,
// "is_locked": false