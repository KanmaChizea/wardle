import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class ControllerCubit extends Cubit<List<TextEditingController>> {
  ControllerCubit()
      : super(List.generate(5, (index) => TextEditingController()));

  void generateControllers() {
    for (var i in state) {
      i.dispose();
    }
    emit(List.generate(5, (index) => TextEditingController()));
  }

  setController(int index, String text) {
    state[index - 1].text = text;
  }

  clearController(int index) {
    state[index - 1].clear();
  }

  nextLine() {
    state[4].text += '\n';
  }

  joinText() {
    return (state[0].text +
            state[1].text +
            state[2].text +
            state[3].text +
            state[4].text)
        .toLowerCase();
  }
}
