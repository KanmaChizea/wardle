import 'package:flutter/material.dart';

import 'cell.dart';

class TextFieldRow extends StatelessWidget {
  const TextFieldRow({
    Key? key,
    this.controllers,
    required this.enabled,
    required this.rowNo,
  }) : super(key: key);

  final List<TextEditingController>? controllers;
  final bool enabled;
  final int rowNo;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextCell(
              controller: controllers?[0],
              index: [rowNo, 0],
              autoFocus: true,
              enabled: enabled),
          const SizedBox(width: 8),
          TextCell(
              controller: controllers?[1],
              index: [rowNo, 1],
              autoFocus: false,
              enabled: enabled),
          const SizedBox(width: 8),
          TextCell(
              controller: controllers?[2],
              index: [rowNo, 2],
              autoFocus: false,
              enabled: enabled),
          const SizedBox(width: 8),
          TextCell(
              controller: controllers?[3],
              index: [rowNo, 3],
              autoFocus: false,
              enabled: enabled),
          const SizedBox(width: 8),
          TextCell(
              controller: controllers?[4],
              index: [rowNo, 4],
              autoFocus: false,
              enabled: enabled)
        ],
      ),
    );
  }
}
