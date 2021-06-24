part of 'models.dart';
class User {
  var firstname;
  var lastname;
  var username;
  var email;
  var password;

  User({
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.password,
  });

  factory User.register(Map<String, dynamic> object) {
    return User(
      username: object['Username']
    );
  }

  static Future<User> connectToRegisterAPI() async {
    final result = await http.post(apiRegister);
    var response = jsonDecode(result.body);

    print(response);

    return response;
  }
}