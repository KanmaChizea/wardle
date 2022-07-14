import 'package:flutter_bloc/flutter_bloc.dart';

class TransitionCubit extends Cubit<bool> {
  TransitionCubit() : super(false);

  void toggle() {
    emit(!state);
  }
}
