import 'package:bloc/bloc.dart';

class FormCubit extends Cubit<int> {
  FormCubit() : super(1);

  void goToNext() {
    if (state <= 6) emit(state + 1);
  }

  void set(int index) {
    emit(index);
  }

  void reset() {
    emit(1);
  }
}
