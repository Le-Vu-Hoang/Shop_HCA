import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial/core/network/config/api_path.dart';
import 'package:e_commercial/core/utils/exception_handler.dart';
import 'package:e_commercial/data/models/address/address_model_mapper.dart';
import 'package:e_commercial/data/models/address/create_address_req.dart';
import 'package:e_commercial/domain/entities/address.dart';

import '../../../data/models/address/address_model.dart';
import '../../../injection/injection_container.dart';
import '../../errors/failure.dart';
import '../config/dio_client.dart';

abstract class AddressApiService {
  Future<Either<Failure, String>> createAddress(CreateAddressReqParams params);

  Future<Either<Failure, List<AddressEntity>>> getAllAddresses();

  Future<Either<Failure, String>> updateAddress(AddressModel params);
}

class AddressApiServiceImpl implements AddressApiService {
  @override
  Future<Either<Failure, String>> createAddress(
      CreateAddressReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiPaths.address.addAddress,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(
          handleDioException(e, contextMessage: 'Failed to create address'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAllAddresses() async {
    try {
      var response =
          await sl<DioClient>().get(ApiPaths.address.getAllAddresses);
      List<AddressEntity> addresses = (response.data as List)
          .map((address) => AddressModel.fromJson(address).toEntity())
          .toList();
      return Right(addresses);
    } on DioException catch (e) {
      return Left(
          handleDioException(e, contextMessage: 'Failed to fetch addresses'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> updateAddress(AddressModel params) async {
    try {
      var response = await sl<DioClient>().put(
        ApiPaths.address.updateAddress,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(
          handleDioException(e, contextMessage: 'Failed to update address'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
