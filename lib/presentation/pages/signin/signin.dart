import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/data/models/auth/signin_req.dart';
import 'package:e_commercial/presentation/blocs/signin/signin_bloc.dart';
import 'package:e_commercial/presentation/blocs/signin/signin_event.dart';
import 'package:e_commercial/presentation/blocs/signin/signin_state.dart';
import 'package:e_commercial/presentation/widgets/button/app_button.dart';
import 'package:e_commercial/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../injection/injection_container.dart';
import '../../../routes/app_router.gr.dart';
import '../../widgets/loading/app_loading.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInLoading) {
            AppLoading.show(context);
          } else {
            AppLoading.hide(context);
          }

          if (state is SignInSuccess) {
            sl<AppRouter>().replace(const MainRoute());
          } else if (state is SignInFailure) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1E1B39),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 100),
                      _logo(context),
                      const SizedBox(height: 20),
                      _emailField(context),
                      const SizedBox(height: 20),
                      _passwordField(context),
                      const SizedBox(height: 10),
                      _textButton(context),
                      const SizedBox(height: 20),
                      Builder(builder: (context) => _loginButton(context)),
                      const SizedBox(height: 240),
                      _supportText(context),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset(
            'assets/images/logo/logo_Fivana.png',
            width: 200,
            height: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Login',
            style: AppTextStyle.withColor(AppTextStyle.h1, Colors.white),
          )
        ]),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.95,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        style: AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
        controller: _emailController,
        decoration: InputDecoration(
            labelText: 'Email',
            labelStyle:
            AppTextStyle.withColor(AppTextStyle.subtitle, Colors.white),
            border: OutlineInputBorder(),
            hintText: 'Enter your email',
            hintStyle:
            AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            filled: true,
            fillColor: Colors.black54),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.95,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        style: AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
        controller: _passwordController,
        decoration: InputDecoration(
            labelText: 'Password',
            labelStyle:
            AppTextStyle.withColor(AppTextStyle.subtitle, Colors.white),
            border: OutlineInputBorder(),
            hintText: 'Enter your password',
            hintStyle:
            AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Colors.white,
            ),
            filled: true,
            fillColor: Colors.black54),
        obscureText: true,
      ),
    );
  }

  Widget _textButton(BuildContext context) {
    return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  sl<AppRouter>().push( ForgotPasswordRoute());
                },
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyle.withColor(
                      AppTextStyle.textLarge, Colors.white),
                )),
            TextButton(
              onPressed: () {
                sl<AppRouter>().push( SignUpRoute());
              },
              child: Text(
                'Sign Up',
                style: AppTextStyle.withColor(
                    AppTextStyle.textLarge, Colors.white),
              ),
            ),
          ],
        ));
  }

  Widget _loginButton(BuildContext context) {
    return AppButton(
      text: 'Login',
      isGradient: false,
      onPressed: () {
        final SignInReqParams params = SignInReqParams(
          email: _emailController.text,
          password: _passwordController.text,
        );
        context.read<SignInBloc>().add(SignInSubmitted(params));
      },
      color: Colors.yellow[600]!,
      icon: Icons.login,
      textStyle: AppTextStyle.withColor(AppTextStyle.buttonLarge, Colors.black),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.90,
    );
  }

  Widget _supportText(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Need help? Contact support',
        style: AppTextStyle.withColor(AppTextStyle.subtitle, Colors.white),
      ),
    );
  }
}
