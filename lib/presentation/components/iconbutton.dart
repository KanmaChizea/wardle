import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onPressed;
  const TextIconButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [Icon(icon), const SizedBox(height: 8), Text(label)],
        ));
  }
}
