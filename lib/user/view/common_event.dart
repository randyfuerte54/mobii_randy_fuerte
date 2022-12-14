import 'package:equatable/equatable.dart';
import 'package:mobii_randy_fuerte/user/view/blocs/user_bloc.dart';

abstract class CommonEvent extends Equatable implements UserEvent {
  const CommonEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends CommonEvent {
  const InitialEvent();
}
