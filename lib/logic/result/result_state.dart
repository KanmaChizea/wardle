part of 'result_cubit.dart';

abstract class ResultState extends Equatable {
  const ResultState();

  @override
  List<Object> get props => [];
}

class ResultInitial extends ResultState {}

class Failed extends ResultState {}

class Won extends ResultState {}
