import 'package:dartz/dartz.dart';
import 'package:e_commercial/domain/entities/address.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';
import '../../repositories/address_repository.dart';
import '../usecasese.dart';

class GetAddressUseCase implements UseCase<Either<Failure, List<AddressEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<AddressEntity>>> call({dynamic params}) async {
    return await sl<AddressRepository>().getAllAddresses();
  }

}