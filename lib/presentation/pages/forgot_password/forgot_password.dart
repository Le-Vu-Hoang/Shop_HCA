import 'package:auto_route/annotations.dart';
import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/presentation/widgets/button/app_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          _emailField(context),
          const SizedBox(height: 20),
          _sendButton(context),
        ],
      )),
    );
  }

  Widget _emailField(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle:
              AppTextStyle.withColor(AppTextStyle.subtitle, Colors.black),
          hintText: 'Enter your email',
          hintStyle: AppTextStyle.withColor(
              AppTextStyle.textLarge, Colors.black),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _sendButton(BuildContext context) {
    return AppButton(
      text: 'Continue',
      onPressed: () {
        print('Gradient button pressed');
      },
      color: AppThemes.primaryColor,
      icon: Icons.send,
      width: MediaQuery.of(context).size.width * 0.8,
    );
  }
}
