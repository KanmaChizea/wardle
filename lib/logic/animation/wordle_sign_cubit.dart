import 'package:bloc/bloc.dart';

class WordleSignCubit extends Cubit<double> {
  WordleSignCubit() : super(0.3);

  void update() {
    if (state > 0) emit(state - 0.05);
  }
}
