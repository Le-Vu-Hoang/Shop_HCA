import 'package:bloc/bloc.dart';
import 'package:e_commercial/data/datasources/local/hive_service.dart';
import 'package:e_commercial/data/models/user/local_user_model.dart';
import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:e_commercial/domain/usecases/Auth/update_user.dart';
import 'package:e_commercial/presentation/blocs/profile/profile_event.dart';
import 'package:e_commercial/presentation/blocs/profile/profile_state.dart';

import '../../../core/errors/failure.dart';
import '../../../data/models/user/user_model.dart';
import '../../../injection/injection_container.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) {
      var data = sl<HiveService>().getCurrentUser();
      emit(ProfileLoaded(data!));
    });

    on<UpdateProfile>((event, emit) async {
      final currentUser = sl<HiveService>().getCurrentUser();
      emit(ProfileLoading(ProfileLoaded(currentUser!)));

      await Future.delayed(Duration(seconds: 2));

      final response = await sl<UpdateUserUseCase>().call(
        params: UpdateUserParams(
          user: event.params,
          avatarFile: event.avatarFile,
        ),
      );

      if (response.isLeft()) {
        emit(ProfileError(response.swap().getOrElse(() => ServerFailure('Unknown')).message));
        return;
      }

      final imageLinkToUse = event.avatarFile != null
          ? event.params.imageLink
          : currentUser.imageLink;

      final updatedUser = event.params.copyWith(imageLink: imageLinkToUse);
      await sl<HiveService>().saveUser(LocalUserModel.fromUserModel(updatedUser));

      emit(ProfileUpdated());
    });

  }
}
