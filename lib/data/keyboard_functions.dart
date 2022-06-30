import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isitaword/isitaword.dart';
import 'package:woodul/data/exceptions.dart';
import '../logic/keyboard_controllers/cubit/cell_cubit.dart';
import '../logic/keyboard_controllers/cubit/controller_cubit.dart';
import '../logic/keyboard_controllers/cubit/form_cubit.dart';

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
  if (index % 6 == 0) {
    String enteredWord = controllerCubit.joinText();
    print(enteredWord);
    if (isItAWord(enteredWord)) {
      controllerCubit.nextLine();
      controllerCubit.generateControllers();
      context.read<CellCubit>().reset();
      FormCubit state = context.read<FormCubit>();
      if (state.state != 6) state.goToNext();
    } else {
      throw WordDoesNotExist();
    }
  } else {
    throw NotEnoughLetters();
  }
}
