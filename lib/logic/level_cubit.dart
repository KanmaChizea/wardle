import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelCubit extends Cubit<int> {
  LevelCubit() : super(1);

  initializeLevel() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('level')) {
      emit(pref.getInt('level')!);
    } else {
      pref.setInt('level', 1);
    }
  }

  gotoLevel(int level) {
    if (level < state) {
      emit(level);
    }
  }

  nextLevel() {
    emit(state + 1);
  }
}
