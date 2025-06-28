import 'package:e_commercial/domain/usecases/usecasese.dart';
import '../../../injection/injection_container.dart';
import '../../repositories/auth_repository.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic params}) async {
    return sl<AuthRepository>().isLoggedIn();
  }
}