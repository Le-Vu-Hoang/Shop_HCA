import 'package:dartz/dartz.dart';
import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';

import '../../../data/models/address/create_address_req.dart';
import '../../../injection/injection_container.dart';
import '../../repositories/address_repository.dart';

class AddNewAddressUseCase implements UseCase<Either<Failure, String>, CreateAddressReqParams> {
  @override
  Future<Either<Failure, String>> call({CreateAddressReqParams? params}) async {
    return await sl<AddressRepository>().createAddress(params!);
  }
}