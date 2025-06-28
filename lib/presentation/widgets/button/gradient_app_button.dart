import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GradientAppButton extends StatelessWidget {
   final String label;
   final IconData icon;
   final VoidCallback onPressed;

  const GradientAppButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: onPressed,
      gradient: const LinearGradient(colors: [
        Colors.cyan,
        Colors.indigo,
      ]),
      shadows: [
        BoxShadow(
          color: Colors.blue.withOpacity(.4),
          spreadRadius: 4,
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}