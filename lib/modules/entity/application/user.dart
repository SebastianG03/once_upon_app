class User {
  final int id;
  String? username;
  String? email;
  String? password;

  User({
    this.id = 0,
    required this.username,
    required this.email,
    required this.password
  });

  User.guest({
    this.id = 0,
    this.username = "Guest",
    this.email = "",
    this.password = ""
  });


}