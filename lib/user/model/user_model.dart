import 'dart:convert';

import 'package:mobii_randy_fuerte/user/view_model/entities/user_entity.dart';
import 'package:mobii_randy_fuerte/utils/extensions/json_extensions.dart';

class ListUserModel extends ListUserEntity {
  ListUserModel({required super.listOfUser});
}

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.imgUrl,
  });

  static const String _paramId = 'id';
  static const String _paramName = 'name';
  static const String _paramImgUrl = 'imageUrl';

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json.toNonNullableString(_paramId),
      name: json.toNonNullableString(_paramName),
      imgUrl: json.toNonNullableString(_paramImgUrl),
    );
  }

  factory UserModel.initial() {
    return UserModel(
      id: '',
      name: '',
      imgUrl: '',
    );
  }

  static List<UserModel> toList(String jsonList) {
    return (jsonDecode(jsonList) as List)
        .map((json) => UserModel.fromJson(json))
        .toList();
  }
}
