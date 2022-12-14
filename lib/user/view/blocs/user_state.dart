part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class GetUserListState extends UserState {
  const GetUserListState({required this.response});

  final List<UserEntity> response;

  @override
  List<Object> get props => [response];
}
