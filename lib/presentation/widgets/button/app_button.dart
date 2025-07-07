import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/button/button_cubit.dart';
import '../../blocs/button/button_state.dart';

class AppButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isGradient;
  final TextStyle? textStyle;
  final Color color;
  final Color? iconColor;
  final double? width;
  final double? iconSize;
  final Color? gradientColor;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isGradient = false,
    this.textStyle,
    required this.color,
    this.iconColor,
    this.width,
    this.iconSize,
    this.gradientColor,
  });

  @override
  Widget build(BuildContext context) {
    final style = textStyle ??
        const TextStyle(color: Colors.white, fontSize: 16);

    final buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            color: iconColor ?? style.color ?? Colors.white,
            size: iconSize ?? 20,
          ),
          const SizedBox(width: 8),
        ],
        Flexible(
            child: Text(text, style: style, overflow: TextOverflow.ellipsis)),
      ],
    );

    final decoration = BoxDecoration(
      gradient: isGradient
          ? LinearGradient(colors: [color, gradientColor ?? color])
          : null,
      color: isGradient ? null : color,
      borderRadius: BorderRadius.circular(30),
    );

    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
          if (state is ButtonLoadingState) {
            return Container(
              width: width ?? double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: decoration,
              child: Center(
                child: CircularProgressIndicator(
                  color: style.color ?? Colors.white,
                ),
              ),
            );
          }
          return InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: decoration,
              child: Center(child: buttonChild),
            ),
          );
        },
      ),
    );
  }
}
