import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cell/cell_state_cubit.dart';
import '../../logic/cell/form_cubit.dart';
import '../styles/colors.dart';

class GuessDistribution extends StatelessWidget {
  const GuessDistribution({Key? key}) : super(key: key);

  Color setColor(CellState value) {
    switch (value) {
      case CellState.unanswered:
        return white;
      case CellState.rr:
        return green;
      case CellState.rw:
        return yellow;
      case CellState.ww:
        return grey2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(builder: (context) {
        final count = context.read<FormCubit>().state != 6
            ? context.read<FormCubit>().state - 1
            : 6;
        List<CellState> compressedList = [];
        final stateList = context.read<CellStateCubit>().state;
        for (int j = 1; j <= count; j++) {
          compressedList.addAll(stateList[j - 1]);
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 200,
            child: GridView.builder(
                itemCount: count * 5,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, crossAxisSpacing: 2, mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return Container(
                    color: setColor(compressedList[index]),
                  );
                }),
          ),
        );
      }),
    );
  }
}
