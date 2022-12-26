import 'package:flutter_bloc/flutter_bloc.dart';

class LevelNavigationCubit extends Cubit<bool> {
  LevelNavigationCubit() : super(true);

  setToTrue() => emit(true);
  setToFalse() => emit(false);
}
