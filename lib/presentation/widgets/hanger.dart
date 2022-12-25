import 'package:flutter/material.dart';

import '../styles/colors.dart';

class Hanger extends StatelessWidget {
  const Hanger({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 134,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: white),
    );
  }
}
