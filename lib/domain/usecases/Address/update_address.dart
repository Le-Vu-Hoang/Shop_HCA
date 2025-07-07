import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../data/models/address/address_model.dart';
import '../../../injection/injection_container.dart';
import '../../repositories/address_repository.dart';
import '../usecasese.dart';

class UpdateAddressUseCase implements UseCase<Either<Failure, String>, AddressModel> {
  @override
  Future<Either<Failure, String>> call({AddressModel? params}) async {
    return await sl<AddressRepository>().updateAddress(params!);
  }
}