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

class ApplicationsError extends ApplicationsState {
  final String message;

  const ApplicationsError(this.message);

  @override
  List<Object> get props => [message];
}
