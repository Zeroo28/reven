part of 'create_app_cubit.dart';

abstract class CreateAppState extends Equatable {
  const CreateAppState();

  @override
  List<Object> get props => [];
}

class LoadingApplication extends CreateAppState {}

class SavingApplication extends CreateAppState {}

class SavedApplication extends CreateAppState {
  final int applicationId;

  const SavedApplication(this.applicationId);

  @override
  List<Object> get props => [applicationId];
}

class LoadedApplication extends CreateAppState {
  final Presence application;

  const LoadedApplication(this.application);

  @override
  List<Object> get props => [application.id ?? 0];
}
