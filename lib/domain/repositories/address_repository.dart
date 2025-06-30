import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../data/models/address/address_model.dart';
import '../../data/models/address/create_address_req.dart';
import '../entities/address.dart';

abstract class AddressRepository {
  Future<Either<Failure, String>> createAddress(CreateAddressReqParams params);

  Future<Either<Failure, List<AddressEntity>>> getAllAddresses();

  Future<Either<Failure, String>> updateAddress(AddressModel params);
}
