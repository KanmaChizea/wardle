import 'package:flutter/material.dart';
import 'package:woodul/presentation/styles/colors.dart';

class MyIcon extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;
  const MyIcon({
    Key? key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon!,
        size: 24,
        color: white,
      ),
    );
  }
}

class SecondaryIcon extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;
  const SecondaryIcon({
    Key? key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon!,
        size: 20,
        color: white,
      ),
    );
  }
}
