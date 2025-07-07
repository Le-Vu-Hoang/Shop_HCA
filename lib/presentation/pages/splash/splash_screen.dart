import 'package:e_commercial/core/auth/auth_state.dart';
import 'package:e_commercial/presentation/pages/splash/widgets/animated_logo.dart';
import 'package:e_commercial/routes/app_router.dart';
import 'package:e_commercial/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/auth/auth_cubit.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../injection/injection_container.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthStateCubit>().appStarted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStateCubit, AuthState>(
      listener: (context, state) {
        print('AuthState changed: $state');
        if (state is Authenticated) {
          sl<AppRouter>().replace(MainRoute());
        } else if (state is Unauthenticated) {
          sl<AppRouter>().replace(SignInRoute());
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[100]!, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AnimatedLogo(),
                Image.asset(
                  "assets/images/logo/logo_Fivana.png",
                  width: 200,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Text(
                  "Chào mừng bạn đến với Fivana",
                  style: AppTextStyle.withColor(
                      AppTextStyle.subtitle, Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
