import 'package:e_commercial/data/models/address/address_model.dart';
import 'package:e_commercial/data/models/address/address_model_mapper.dart';
import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:e_commercial/domain/entities/user.dart';
import 'package:hive/hive.dart';

part 'local_user_model.g.dart';

@HiveType(typeId: 1)
class LocalUserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? imageLink;

  @HiveField(2)
  final String? fullName;

  @HiveField(3)
  final String accountName;

  @HiveField(4)
  final String? birthday;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String? numberPhone;

  @HiveField(7)
  final bool isLocked;

  @HiveField(8)
  final List<AddressModel> addresses;

  LocalUserModel({
    required this.id,
    this.imageLink,
    this.fullName,
    required this.accountName,
    this.birthday,
    required this.email,
    this.numberPhone,
    required this.isLocked,
    this.addresses = const [],
  });

  factory LocalUserModel.fromUserModel(UserModel user) {
    return LocalUserModel(
      id: user.id,
      imageLink: user.imageLink,
      fullName: user.fullName,
      accountName: user.accountName,
      birthday: user.birthday,
      email: user.email,
      numberPhone: user.numberPhone,
      isLocked: user.isLocked,
      addresses: user.addresses.map((e) => AddressModel.fromEntity(e)).toList(),
    );
  }

  factory LocalUserModel.fromEntity(UserEntity user) {
    return LocalUserModel(
      id: user.id,
      imageLink: user.imageLink,
      fullName: user.fullName,
      accountName: user.accountName,
      birthday: user.birthday,
      email: user.email,
      numberPhone: user.numberPhone,
      isLocked: user.isLocked,
      addresses: user.addresses.map((e) => AddressModel.fromEntity(e)).toList(),
    );
  }

  UserModel toUserModel() {
    return UserModel(
      id: id,
      fullName: fullName,
      email: email,
      birthday: birthday,
      numberPhone: numberPhone,
      accountName: accountName,
      isLocked: isLocked,
      imageLink: imageLink,
      addresses: addresses.map((e) => e.toEntity()).toList(),
    );
  }

  LocalUserModel copyWith({
    String? fullName,
    String? imageLink,
    String? accountName,
    String? email,
    String? birthday,
    String? numberPhone,
    List<AddressModel>? addresses,
  }) {
    return LocalUserModel(
      id: id,
      imageLink: imageLink ?? this.imageLink,
      fullName: fullName ?? this.fullName,
      accountName: accountName ?? this.accountName,
      birthday: birthday ?? this.birthday,
      email: email ?? this.email,
      numberPhone: numberPhone ?? this.numberPhone,
      isLocked: isLocked,
      addresses: addresses ?? this.addresses,
    );
  }
}
