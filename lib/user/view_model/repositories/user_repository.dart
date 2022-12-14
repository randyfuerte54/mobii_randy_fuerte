import 'package:mobii_randy_fuerte/user/model/user_model.dart';
import 'package:mobii_randy_fuerte/user/view_model/entities/user_entity.dart';
import 'package:mocktail/mocktail.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();

  UserEntity selectedUser = UserModel.initial();

  final String baseUrl =
      'https://gist.githubusercontent.com/dustincatap/66d48847b3ca07af7cef789d6ac8fee8/raw/550798be0efa8b98f6924cfb4ad812cd290f568a/users.json';
}

class MockUserRepository extends Mock implements UserRepository {}
