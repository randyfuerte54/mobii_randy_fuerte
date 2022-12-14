import 'package:equatable/equatable.dart';
import 'package:mobii_randy_fuerte/user/view/blocs/user_bloc.dart';

abstract class CommonState extends Equatable implements UserState {
  const CommonState();

  @override
  List<Object> get props => [];
}

class InitialState extends CommonState {
  const InitialState();
}

class LoadingState extends CommonState {
  const LoadingState();
}

class ErrorState extends CommonState {
  const ErrorState();
}
