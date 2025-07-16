import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoading {
  static bool _isDialogOpen = false;

  static void show(BuildContext context) {
    if (_isDialogOpen) return;

    _isDialogOpen = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Lottie.asset(
          "assets/animations/Animation - loading.json",
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    if (_isDialogOpen && Navigator.canPop(context)) {
      Navigator.of(context).pop();
      _isDialogOpen = false;
    }
  }

  static Widget overlay() {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: Lottie.asset(
          "assets/animations/Animation - loading.json",
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
