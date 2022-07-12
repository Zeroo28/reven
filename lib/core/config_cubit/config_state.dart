part of 'config_cubit.dart';

abstract class ConfigState extends Equatable {
  const ConfigState();

  @override
  List<Object> get props => [];
}

class LoadingConfig extends ConfigState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeLoading { }';
}

class ConfigLoaded extends ConfigState {
  final bool firstRun;

  const ConfigLoaded(this.firstRun);

  @override
  List<Object> get props => [firstRun];

  @override
  String toString() => 'HomeLoaded { firstRun: $firstRun }';
}

class ConfigError extends ConfigState {
  final dynamic message;

  const ConfigError(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'HomeError { message: $message }';
}
