import 'package:flutter/material.dart';
import 'package:woodul/presentation/styles/colors.dart';

errorSnackBar(String message, BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return SnackBar(
    content: Center(
      child: Text(message,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: white)),
    ),
    backgroundColor: primary,
    margin: EdgeInsets.fromLTRB(100, 70, 100, height / 1.28),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 1000),
  );
}
