import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woodul/logic/cell/cell_state_cubit.dart';

class KeyStateCubit extends Cubit<Map<String, CellState>> {
  KeyStateCubit() : super({});

  newState(Map<String, CellState> newState) {
    final changed = {...state};
    changed.addAll(newState);
    emit(changed);
  }

  resetState() {
    emit({});
  }
}
