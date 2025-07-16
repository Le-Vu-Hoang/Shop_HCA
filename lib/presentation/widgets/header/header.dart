import 'package:e_commercial/presentation/blocs/user_infor/user_infor_state.dart';
import 'package:e_commercial/presentation/widgets/loading/app_loading.dart';
import 'package:e_commercial/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../injection/injection_container.dart';
import '../../../routes/app_router.gr.dart';
import '../../blocs/user_infor/user_infor_cubit.dart';
import '../search/search.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInforCubit()..displayUserInfor(),
      child: BlocListener<UserInforCubit, UserInforState>(
        listener: (context, state) {
          if (state is UserInforLoading) {
            AppLoading.show(context);
          } else {
            AppLoading.hide(context);
          }

          if (state is LoadUserInforFailure) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        child: BlocBuilder<UserInforCubit, UserInforState>(
          builder: (context, state) {
            if (state is UserInforLoaded) {
              return Row(
                children: [
                  _avatar(state.user.imageLink),
                  const SizedBox(width: 12),
                  const Expanded(child: Search()),
                  IconButton(
                    icon: const Icon(Icons.message_outlined,
                        color: Colors.white, size: 24),
                    onPressed: () => print('Notify button pressed'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart,
                        color: Colors.white, size: 24),
                    onPressed: () {
                      sl<AppRouter>().push(CartRoute());
                    },
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _avatar(String? avatarUrl) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
      child: avatarUrl == null
          ? const Icon(Icons.person, size: 24, color: Colors.white)
          : null,
    );
  }
}
