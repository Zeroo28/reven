part of 'rpc_cubit.dart';

abstract class RpcState extends Equatable {
  const RpcState();

  @override
  List<Object> get props => [];
}

class RpcNone extends RpcState {}

class RpcLoading extends RpcState {}

class RpcActive extends RpcState {}

class RpcOffline extends RpcState {}

class RpcError extends RpcState {}
