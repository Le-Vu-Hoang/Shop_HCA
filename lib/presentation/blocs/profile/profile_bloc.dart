import 'package:bloc/bloc.dart';
import 'package:e_commercial/data/datasources/local/hive_service.dart';
import 'package:e_commercial/data/models/user/local_user_model.dart';
import 'package:e_commercial/data/models/user/user_model.dart';
import 'package:e_commercial/domain/usecases/Auth/update_user.dart';
import 'package:e_commercial/presentation/blocs/profile/profile_event.dart';
import 'package:e_commercial/presentation/blocs/profile/profile_state.dart';

import '../../../data/models/user/user_model.dart';
import '../../../injection/injection_container.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) {
      var data = sl<HiveService>().getCurrentUser();
      emit(ProfileLoaded(data!));
    });

    on<UpdateProfile>((event, emit) async {
      emit(ProfileLoading());
      await Future.delayed(Duration(seconds: 2));
      var response = await sl<UpdateUserUseCase>().call(
        params: UpdateUserParams(
          user: event.params,
          avatarFile: event.avatarFile,
        ),
      );
      response.fold(
        (failure) {
          emit(ProfileError(failure.message));
        },
        (success) async {
          var user = UserModel.fromJson(event.params.toJson());
          await sl<HiveService>().saveUser(LocalUserModel.fromUserModel(user));
          emit(ProfileUpdated());
        },
      );
    });
  }
}
