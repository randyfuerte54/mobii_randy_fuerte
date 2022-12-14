import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobii_randy_fuerte/user/view/blocs/common_state.dart';
import 'package:mobii_randy_fuerte/user/view/common_event.dart';
import 'package:mobii_randy_fuerte/user/view_model/entities/user_entity.dart';
import 'package:mobii_randy_fuerte/user/view_model/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userRepository}) : super(const InitialState()) {
    on<InitialEvent>(_initialEvent);
    on<GetUserListEvent>(_getUserListEvent);
  }

  late final UserRepository userRepository;

  Future<void> _initialEvent(
    InitialEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const InitialState());
  }

  Future<void> _getUserListEvent(
    GetUserListEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const LoadingState());
    try {
      final response = await userRepository.getUsers();
      response.toSet().toList();
      emit(GetUserListState(response: response));
    } catch (e) {
      emit(const ErrorState());
    }
  }
}
