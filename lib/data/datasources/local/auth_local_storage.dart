import 'package:e_commercial/data/datasources/local/auth_storage_service.dart';

import '../../../injection/injection_container.dart';

abstract class AuthLocalStorage {
  Future<bool> isLoggedIn();
}

class AuthLocalStorageImpl implements AuthLocalStorage {

  @override
  Future<bool> isLoggedIn() async {
    var auth = await sl<AuthStorageService>().readAuth();
    if(auth == null) {
      return false;
    } else {
      return true;
    }
  }
}