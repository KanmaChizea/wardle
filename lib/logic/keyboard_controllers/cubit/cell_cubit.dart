import 'package:bloc/bloc.dart';

class CellCubit extends Cubit<int> {
  CellCubit() : super(1);

  void nextCell() {
    if (state < 6) emit(state + 1);
  }

  previousCell() {
    if (state > 1) emit(state - 1);
  }

  void reset() {
    emit(1);
  }
}
