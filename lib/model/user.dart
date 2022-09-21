class User {
  String id;
  String nickname;
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
