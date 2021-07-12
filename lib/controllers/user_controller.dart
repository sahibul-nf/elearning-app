part of 'controllers.dart';

class UserController extends GetxController {
  var id = ''.obs;
  var username = ''.obs;
  String? token = '';

  userLogin(var email, var password) {
    try {
      AuthService().login(email: email, password: password).then((value) {
        print(value.body);
        print(value.headers);

        var resBody = value.body;
        // var cookies = value.headers!['set-cookie'];
        // if (cookies!.isNotEmpty && cookies.length == 2) {
        //   final authToken = cookies[1].split(';')[0].obs;

        //   token = authToken;
        //   print(authToken);x
        // }

        // print(cookies);

        token = value.headers!['set-cookie'];
        print(token);

        // var userID = resBody['User_id'].toString();
        this.id = resBody['User_id'].toString().obs;
        this.username = resBody['Username'].toString().obs;

        _saveData(
          resBody['User_id'],
          resBody['Username'].toString(),
        );

        var user = User();
        print("ID = ${user.id}");
        print("Username = ${user.username}");

        user.id = this.id.value;
        user.username = this.username.toString();

        print("Username = ${user.username}");
        print("Username = ${user.username}");
        print(user.id);

        var statusCode = resBody['Status'];

        if (statusCode == 200) {
          DialogController().successDialog("Successfully Logged", () {
            Get.close(0);
            Get.offAndToNamed("/home");
          });
        } else {
          var message = resBody['Message'];
          Get.snackbar(
            "Login is failed",
            "$message",
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            backgroundColor: errorColor,
            colorText: bgColor,
          );
        }
      });
    } catch (e) {
      print("Error ni" + e.toString());
    }
  }

  registerUser(var firstname, var lastname, var email, var password,
      var confirmPassword) {}

  _saveData(var id, var username) async {
    try {
      final _sharePref = await SharedPreferences.getInstance();

      // final _storage = FlutterSecureStorage();

      // await _storage.write(key: 'username', value: username);

      // var user = await _storage.read(key: 'username');
      // print(user);

      _sharePref.setString('token', token.toString());

      _sharePref.setInt('id', id);
      var a = _sharePref.setString('username', username);

      print("Pref : $a");

      this.id = _sharePref.getInt('id').toString().obs;
      this.username = _sharePref.getString('username').toString().obs;
    } catch (e) {
      print(e);
    }
  }
}
