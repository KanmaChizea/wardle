import 'package:flutter/material.dart';

class TextCell extends StatelessWidget {
  final TextEditingController? controller;
  final bool autoFocus;
  final bool enabled;
  const TextCell({
    Key? key,
    this.controller,
    required this.autoFocus,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        readOnly: true,
        showCursor: false,
        controller: controller,
        maxLength: 1,
        enabled: enabled,
        decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey)),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
