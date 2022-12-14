import 'package:flutter_test/flutter_test.dart';
import 'package:mobii_randy_fuerte/user/view/blocs/common_state.dart';
import 'package:mobii_randy_fuerte/user/view/blocs/user_bloc.dart';
import 'package:mobii_randy_fuerte/user/view/common_event.dart';
import 'package:mobii_randy_fuerte/user/view_model/entities/user_entity.dart';
import 'package:mobii_randy_fuerte/user/view_model/repositories/user_repository.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late UserBloc bloc;
  late UserRepository repository;
  setUp(() {
    repository = MockUserRepository();
    bloc = UserBloc(userRepository: repository);
  });

  test(
    'InitialEvent -> InitialState',
    () {
      const event = InitialEvent();
      bloc.add(event);

      expectLater(
        bloc.stream,
        emitsInOrder(
          <UserState>[
            const InitialState(),
          ],
        ),
      );

      expect(event.props, []);
    },
  );

  test(
    'GetUserListEvent -> LoadingState ->GetUserListState',
    () {
      final List<UserEntity> response = [];
      const event = GetUserListEvent();
      when(() => repository.getUsers()).thenAnswer((_) async => response);
      bloc.add(event);

      expectLater(
        bloc.stream,
        emitsInOrder(
          <UserState>[
            const LoadingState(),
            GetUserListState(response: response),
          ],
        ),
      );

      expect(event.props, response);
    },
  );

  test(
    'GetUserListEvent -> LoadingState -> GenericError',
    () {
      const response = ErrorState();
      const event = GetUserListEvent();
      when(() => repository.getUsers()).thenThrow(response);
      bloc.add(event);

      expectLater(
        bloc.stream,
        emitsInOrder(
          <UserState>[
            const LoadingState(),
            const ErrorState(),
          ],
        ),
      );

      expect(event.props, []);
    },
  );
}
