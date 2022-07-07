part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeLoading { }';
}

class HomeLoaded extends HomeState {
  final bool firstRun;

  const HomeLoaded(this.firstRun);

  @override
  List<Object> get props => [firstRun];

  @override
  String toString() => 'HomeLoaded { firstRun: $firstRun }';
}

class HomeError extends HomeState {
  final dynamic message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'HomeError { message: $message }';
}