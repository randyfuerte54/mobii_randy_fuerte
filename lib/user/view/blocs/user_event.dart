part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class GetUserListEvent extends UserEvent {
  const GetUserListEvent();

  @override
  List<Object?> get props => [];
}
