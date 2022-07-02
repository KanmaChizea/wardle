import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isitaword/isitaword.dart';
import 'package:woodul/data/exceptions.dart';
import 'package:woodul/data/wordlist.dart';
import 'package:woodul/logic/cell/cell_state_cubit.dart';
import 'package:woodul/logic/keyboard/key_state.dart';
import 'package:woodul/logic/result/result_cubit.dart';
import '../logic/cell/cell_cubit.dart';
import '../logic/keyboard/controller_cubit.dart';
import '../logic/cell/form_cubit.dart';

add(BuildContext context, String letter) {
  int index = context.read<CellCubit>().state;
  if (index < 6) {
    context.read<ControllerCubit>().setController(index, letter);
    context.read<CellCubit>().nextCell();
  } else {
    throw EndOfWord();
  }
}

delete(BuildContext context) {
  context.read<CellCubit>().previousCell();
  int index = context.read<CellCubit>().state;

  if (index >= 1) {
    context.read<ControllerCubit>().clearController(index);
  } else {
    throw NothingToDelete();
  }
}

enter(BuildContext context) {
  ControllerCubit controllerCubit = context.read<ControllerCubit>();
  int index = context.read<CellCubit>().state;
  if (index % 6 != 0) {
    throw NotEnoughLetters();
  }
  String enteredWord = controllerCubit.joinText();
  if (!isItAWord(enteredWord)) {
    throw WordDoesNotExist();
  }
  FormCubit state = context.read<FormCubit>();
  List newstates = processEntry(enteredWord);
  context.read<CellStateCubit>().newState(newstates[0], state.state);
  context.read<KeyStateCubit>().newState(newstates[1]);
  if (context
      .read<CellStateCubit>()
      .state[state.state - 1]
      .every((e) => e == CellState.rr)) {
    context.read<ResultCubit>().levelWon();
  }
  controllerCubit.nextLine();
  controllerCubit.generateControllers();
  context.read<CellCubit>().reset();

  if (state.state != 6) {
    state.goToNext();
  } else {
    context.read<ResultCubit>().levelFailed();
  }
  ;
}

processEntry(String enteredWord) {
  List<CellState> cellstate = [];
  final Map<String, CellState> keystate = {};

  String levelAnswer = answers[0];
  for (int i = 0; i < levelAnswer.length; i++) {
    if (enteredWord[i] == levelAnswer[i]) {
      cellstate.insert(i, CellState.rr);
      keystate[enteredWord[i]] = CellState.rr;
    } else if (levelAnswer.contains(enteredWord[i]) &&
        levelAnswer[i] != enteredWord[i]) {
      cellstate.insert(i, CellState.rw);
      keystate[enteredWord[i]] = CellState.rw;
    } else {
      cellstate.insert(i, CellState.ww);
      keystate[enteredWord[i]] = CellState.ww;
    }
  }
  return [cellstate, keystate];
}

int guessDistribution(List data) {
  int count = 0;
  for (var element in data) {
    if (element == CellState.rr) count++;
  }
  return count;
}
