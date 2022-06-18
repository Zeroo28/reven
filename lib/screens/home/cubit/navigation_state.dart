part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavHome extends NavigationState {}

class NavSettings extends NavigationState {}

class NavAbout extends NavigationState {}
