import 'dart:ui';

import 'package:flutter/material.dart';

import '../styles/colors.dart';

extension IconCustomization on Widget {
  ClipRRect primaryButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: whiteGradient,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: white,
                  width: 1,
                ),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 16,
                      color: Color(0x3E000000))
                ]),
            child: this),
      ),
    );
  }

  secondaryButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: secondary, borderRadius: BorderRadius.circular(12)),
      child: this,
    );
  }
}
