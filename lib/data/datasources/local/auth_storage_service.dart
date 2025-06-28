import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../models/auth/auth_model.dart';

class AuthStorageService {
  final FlutterSecureStorage _storage;

  static const _authKey = 'user-auth';

  AuthStorageService(this._storage);

  Future<void> saveAuth(AuthModel model) async {
    final json = jsonEncode(model.toJson());
    await _storage.write(key: _authKey, value: json);
  }

  Future<AuthModel?> readAuth() async {
    final jsonString = await _storage.read(key: _authKey);
    if (jsonString == null) return null;

    try {
      final map = jsonDecode(jsonString);
      return AuthModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  Future<void> clearAuth() async {
    await _storage.delete(key: _authKey);
  }

  Future<String?> getAccessToken() async {
    final model = await readAuth();
    return model?.accessToken;
  }
}
