import 'package:image_picker/image_picker.dart';
import '../../../data/models/user/user_model.dart';

abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}



class UpdateProfile extends ProfileEvent {
  final UserModel params;
  final XFile? avatarFile;

  UpdateProfile(this.params, this.avatarFile);
}