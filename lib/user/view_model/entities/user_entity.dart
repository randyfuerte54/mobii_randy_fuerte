class ListUserEntity {
  final List<UserEntity> listOfUser;

  ListUserEntity({required this.listOfUser});
}

class UserEntity {
  final String id;
  final String name;
  final String imgUrl;

  UserEntity({
    required this.id,
    required this.name,
    required this.imgUrl,
  });
}
