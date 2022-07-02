import 'package:bloc/bloc.dart';

//first letter signifies letter
//second letter siginifies position
// r-right, w-wrong

enum CellState { unanswered, rr, rw, ww }

class CellStateCubit extends Cubit<List<List<CellState>>> {
  CellStateCubit()
      : super(List.generate(
            6, (index) => List.generate(5, (index) => CellState.unanswered)));

  newState(List<CellState> newstate, int index) {
    List<List<CellState>> newList = [...state];
    newList[index - 1] = newstate;
    emit(newList);
  }
}
