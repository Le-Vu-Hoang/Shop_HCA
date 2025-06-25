import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthStorageService {
  final _storage = FlutterSecureStorage();
  static const _authTokenKey = 'auth_token';
  static const _authTokenRefreshKey = 'auth_token_refresh';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _authTokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _authTokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _authTokenKey);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: _authTokenRefreshKey, value: refreshToken);
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}