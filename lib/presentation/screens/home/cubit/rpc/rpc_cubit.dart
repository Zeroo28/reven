import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'rpc_state.dart';

class RpcCubit extends Cubit<RpcState> {
  RpcCubit() : super(RpcNone());
}
