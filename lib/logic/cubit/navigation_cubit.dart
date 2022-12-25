import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  NavigationState previousState = NavigationInitial();

  @override
  void onChange(Change<NavigationState> change) {
    if (change.nextState > change.currentState) {
      previousState = change.currentState;
    }
    super.onChange(change);
  }

  void level() {
    emit(NavigationLevel());
  }

  void info() {
    emit(NavigationInfo());
  }

  void menu() {
    emit(NavigationInitial());
  }

  void goback() {
    emit(previousState);
  }

  void play() {
    emit(NavigationGame());
  }
}
