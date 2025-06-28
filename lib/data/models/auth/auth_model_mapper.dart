
import '../../../domain/entities/auth.dart';
import 'auth_model.dart';

extension AuthXModel on AuthModel {
  AuthEntity toEntity() {
    return AuthEntity(
      accessToken: accessToken,
      // refreshToken: refreshToken,
      id: id,
      role: role,
      locked: locked,
    );
  }
}