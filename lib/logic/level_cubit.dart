import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelCubit extends Cubit<int> {
  LevelCubit() : super(1);

  int highestLevel = 1;

  initializeLevel() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('level')) {
      final level = pref.getInt('level')!;
      highestLevel = level;
      emit(level);
    } else {
      pref.setInt('level', 1);
    }
  }

  gotoLevel(int level) {
    if (level < state) {
      emit(level);
    }
  }

  nextLevel() async {
    final pref = await SharedPreferences.getInstance();
    final level = pref.getInt('level');
    print(level);
    if (state + 1 > level!) {
      pref.setInt('level', state + 1);
      highestLevel = state + 1;
    }
    emit(state + 1);
    print(highestLevel);
    print(pref.getInt('level'));
  }
}
