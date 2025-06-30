import 'package:dartz/dartz.dart';

import 'package:e_commercial/core/errors/failure.dart';
import 'package:e_commercial/core/network/service/address_api_service.dart';

import 'package:e_commercial/data/models/address/address_model.dart';

import 'package:e_commercial/data/models/address/create_address_req.dart';

import 'package:e_commercial/domain/entities/address.dart';

import '../../domain/repositories/address_repository.dart';
import '../../injection/injection_container.dart';

class AddressRepositoryImpl implements AddressRepository {
  @override
  Future<Either<Failure, String>> createAddress(
      CreateAddressReqParams params) async {
    return await sl<AddressApiService>().createAddress(params);
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAllAddresses() async {
    return await sl<AddressApiService>().getAllAddresses();
  }

  @override
  Future<Either<Failure, String>> updateAddress(AddressModel params) async {
    return await sl<AddressApiService>().updateAddress(params);
  }
}
