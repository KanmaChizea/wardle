import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/cell/cell_state_cubit.dart';
import 'package:woodul/presentation/styles/textstyles.dart';

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
              style: body1,
              autofocus: autoFocus,
              textAlign: TextAlign.center,
              readOnly: true,
              showCursor: false,
              controller: controller,
              maxLength: 1,
              enabled: enabled,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900)),
                  disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900)),
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
