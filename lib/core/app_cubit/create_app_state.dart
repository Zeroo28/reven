part of 'create_app_cubit.dart';

abstract class ApplicationsState extends Equatable {
  const ApplicationsState();

  @override
  List<Object> get props => [];
}

class ApplicationsLoading extends ApplicationsState {}

class ApplicationsLoaded extends ApplicationsState {
  final List<Applications> applications;

  const ApplicationsLoaded(this.applications);

  @override
  List<Object> get props => [applications];
}

class ApplicationFound extends ApplicationsState {
  final Applications application;

  const ApplicationFound(this.application);

  @override
  List<Object> get props => [application];
}

class ApplicationsError extends ApplicationsState {
  final String error;
  final StackTrace? st;

  const ApplicationsError(this.error, {this.st});

  @override
  List<Object> get props => [error];
}
