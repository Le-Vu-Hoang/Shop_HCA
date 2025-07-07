import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/user.dart';

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

  LocalUserModel({
    required this.id,
    this.imageLink,
    this.fullName,
    required this.accountName,
    this.birthday,
    required this.email,
    this.numberPhone,
    required this.isLocked,
  });

  /// Optional: convert from your API model
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
    );
  }

  /// Optional: convert from Entity to Model
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
    );
  }
}
