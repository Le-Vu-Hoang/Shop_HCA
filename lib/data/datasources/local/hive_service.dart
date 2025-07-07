import 'package:hive/hive.dart';

import '../../models/user/local_user_model.dart';

class HiveService {
  Future<void> init () async {
    if(!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(LocalUserModelAdapter());
    }
    await Hive.openBox<LocalUserModel>('userBox');
  }

  //Lưu và lấy người dùng hiện tại từ hive box
  //=============================================
  LocalUserModel? getCurrentUser() {
    final box = Hive.box<LocalUserModel>('userBox');
    return box.get('user');
  }

  Future<void> saveUser(LocalUserModel user) async {
    final box = Hive.box<LocalUserModel>('userBox');
    await box.put('user', user);
  }
  //=============================================
}
