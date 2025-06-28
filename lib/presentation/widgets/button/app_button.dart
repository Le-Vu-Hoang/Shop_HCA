import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      leading: isLoading
          ? const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      )
          : leading,
      trailing: trailing,
      child: child,
    );
  }
}
