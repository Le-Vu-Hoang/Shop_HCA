import 'package:auto_route/annotations.dart';
import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/presentation/blocs/signup/signup_bloc.dart';
import 'package:e_commercial/presentation/blocs/signup/signup_event.dart';
import 'package:e_commercial/presentation/blocs/signup/signup_state.dart';
import 'package:e_commercial/presentation/widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/models/auth/signup_req.dart';
import '../../../injection/injection_container.dart';
import '../../../routes/app_router.dart';
import '../../../routes/app_router.gr.dart';
import '../../widgets/loading/app_loading.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if(state is SignUpLoading) {
            AppLoading.show(context);
          } else {
            AppLoading.hide(context);
          }
          if (state is SignUpSuccess) {
            sl<AppRouter>().replace(const MainRoute());
          } else if (state is SignUpFailure) {
           Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity. TOP,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100),
                        _logo(context),
                        const SizedBox(height: 20),
                        _accountNameField(context),
                        const SizedBox(height: 20),
                        _emailField(context),
                        const SizedBox(height: 20),
                        _passwordField(context),
                        _signInButton(context),
                        const SizedBox(height: 20),
                        Builder(
                          builder: (context) => _buttonSignUp(context),
                        ),
                        const Spacer(),
                      ],
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
            'Sign Up',
            style: AppTextStyle.withColor(AppTextStyle.h1, Colors.white),
          )
        ]),
      ),
    );
  }

  Widget _accountNameField(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.95,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        style: AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
        controller: _accountNameController,
        decoration: InputDecoration(
          labelText: 'Account Name',
          labelStyle:
          AppTextStyle.withColor(AppTextStyle.subtitle, Colors.white),
          hintText: 'Enter your account name',
          hintStyle:
          AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
          prefixIcon: const Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black54,
          border: OutlineInputBorder(),
        ),
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
          hintText: 'Enter your email',
          hintStyle:
          AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black54,
          border: OutlineInputBorder(),
        ),
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
          hintText: 'Enter your password',
          hintStyle:
          AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.black54,
          border: OutlineInputBorder(),
        ),
        obscureText: true,
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.95,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            sl<AppRouter>().push( SignInRoute());
          },
          child: Text('Already have an account? Sign In',
              style:
              AppTextStyle.withColor(AppTextStyle.textLarge, Colors.white)),
        ),
      ),
    );
  }

  Widget _buttonSignUp(BuildContext context) {
    return AppButton(
      text: 'Sign Up',
      onPressed: () {
        final SignUpReqParams params = SignUpReqParams(
          accountName: _accountNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );
        context.read<SignUpBloc>().add(SignUpSubmitted(params));
      },
      width: MediaQuery
          .of(context)
          .size
          .width * 0.9,
      color: AppThemes.primaryColor,
      textStyle: AppTextStyle.withColor(AppTextStyle.buttonLarge, Colors.white),
      icon: Icons.login_outlined,
      iconColor: Colors.white,
    );
  }
}
