import '../../injection/injection_container.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<void> call({dynamic params}) async {
    return sl<AuthRepository>().isLoggedIn();
  }
}