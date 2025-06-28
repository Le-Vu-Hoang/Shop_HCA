import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:e_commercial/domain/entities/user.dart';

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      imageLink: imageLink,
      fullName: fullName,
      accountName: accountName,
      birthday: birthday,
      email: email,
      numberPhone: numberPhone,
      isLocked: isLocked,
    );
  }
}