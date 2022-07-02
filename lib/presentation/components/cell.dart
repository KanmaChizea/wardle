import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/cell/cell_state_cubit.dart';

class TextCell extends StatelessWidget {
  final TextEditingController? controller;
  final bool autoFocus;
  final bool enabled;
  final List<int> index;
  const TextCell({
    Key? key,
    this.controller,
    required this.autoFocus,
    required this.enabled,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int row = index[0];
    int col = index[1];
    return SizedBox(
        height: 55,
        width: 50,
        child: BlocBuilder<CellStateCubit, List<List<CellState>>>(
          builder: (context, state) {
            return TextField(
              autofocus: autoFocus,
              textAlign: TextAlign.center,
              readOnly: true,
              showCursor: false,
              controller: controller,
              maxLength: 1,
              enabled: enabled,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2)),
                  disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade700)),
                  counterText: '',
                  filled:
                      state[row][col] == CellState.unanswered ? false : true,
                  fillColor: state[row][col] == CellState.rr
                      ? Colors.green
                      : (state[row][col] == CellState.rw
                          ? Colors.yellow
                          : Colors.grey.shade400)),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            );
          },
        ));
  }
}
