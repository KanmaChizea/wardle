part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];

  bool operator >(NavigationState other) {
    if (this is NavigationInitial) return false;
    return true;
  }
}

class NavigationInitial extends NavigationState {}

class NavigationLevel extends NavigationState {}

class NavigationInfo extends NavigationState {}

class NavigationGame extends NavigationState {}
