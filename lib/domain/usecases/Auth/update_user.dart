import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:e_commercial/domain/repositories/auth_repository.dart';
import 'package:e_commercial/domain/usecases/usecasese.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/failure.dart';
import '../../../injection/injection_container.dart';

class UpdateUserUseCase implements UseCase<Either<Failure, String>, UpdateUserParams> {
  @override
  Future<Either<Failure, String>> call({UpdateUserParams? params}) async {
    try {
      final formData = FormData.fromMap(params!.user.toJson());

      if (params.avatarFile != null) {
        formData.files.add(
          MapEntry(
            'image',
            await MultipartFile.fromFile(
              params.avatarFile!.path,
              filename: 'avatar.jpg',
            ),
          ),
        );
      }
      return await sl<AuthRepository>().updateUser(formData);
    } catch (e) {
      return Left(ServerFailure('Upload failed: $e'));
    }
  }
}

class UpdateUserParams {
  final UserModel user;
  final XFile? avatarFile;

  UpdateUserParams({required this.user, this.avatarFile});
}
