part of 'controllers.dart';

class UserController extends GetxController {
  var id = ''.obs;
  var username = ''.obs;
  var token = ''.obs;

  userLogin(var email, var password) {
    try {
      AuthService().login(email: email, password: password).then((value) {
        print(value.body);
        print(value.headers);

        var resBody = value.body;
        var cookies = value.headers!['set-cookie'];
        if (cookies!.isNotEmpty && cookies.length == 2) {
          final authToken = cookies[1].split(';')[0].obs;

          token = authToken;
          print(authToken);
        }

        print(cookies);

        // var userID = resBody['User_id'].toString();
        this.id = resBody['User_id'].toString().obs;
        this.username = resBody['Username'].toString().obs;

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
          DialogController().successDialog(
            "Successfully Logged",
            () => Get.toNamed("/home"),
          );
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
      print(e);
    }
  }

  registerUser(var firstname, var lastname, var email, var password,
      var confirmPassword) {}
}
