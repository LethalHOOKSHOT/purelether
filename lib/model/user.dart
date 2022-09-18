import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String nickname;
  @HiveField(2)
  String password;

  User({required this.id, required this.nickname, required this.password});

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "password": password,
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'], nickname: json['nickname'], password: json['password']);

  @override
  String toString() =>
      "User{id: $id, nickname: $nickname, password: $password}";
}
