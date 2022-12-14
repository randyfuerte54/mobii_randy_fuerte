import 'package:http/http.dart' as http;
import 'package:mobii_randy_fuerte/user/model/user_model.dart';
import 'package:mobii_randy_fuerte/user/view_model/entities/user_entity.dart';
import 'package:mobii_randy_fuerte/user/view_model/repositories/user_repository.dart';
import 'package:mobii_randy_fuerte/utils/extensions/list_extensions.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<List<UserEntity>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    final list = UserModel.toList(response.body);
    return list.unique((x) => x.id);
  }
}
