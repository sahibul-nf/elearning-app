part of 'services.dart';

class AuthUserService extends GetxController {
  // RegisterPage r = Get.put(RegisterPage());
  DialogController _dialogController = Get.put(DialogController());
  User user = Get.put(User());

  register(
      {var firstname,
      var lastname,
      var email,
      var password,
      var confirmPassword}) async {
    var data = {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };

    var req = await http.post(apiRegister, body: data);
    var res = jsonDecode(req.body);

    // user.userID = res['User_id'].obs;

    var statusCode = res['Status'];
    var message = res['Message'];

    if (statusCode == 200) {
      _dialogController.successDialog(
        "Successfully Registered",
        () => Get.toNamed("/login"),
      );
    } else {
      Get.snackbar(
        "Login is failed",
        "$message",
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        backgroundColor: errorColor,
        colorText: bgColor,
      );
    }
  }

  login({var email, password}) async {
    var data = {
      'email': email,
      'password': password,
    };

    var req = await http.post(apiLogin, body: data);
    var res = jsonDecode(req.body);

    user.username = res['Username'].toString().obs;
    user.userID = res['User_id'].toString().obs;

    var statusCode = res['Status'];
    var message = res['Message'];

    if (statusCode == 200) {
      _dialogController.successDialog(
        "Successfully Logged",
        () => Get.toNamed("/home"),
      );
    } else {
      Get.snackbar(
        "Login is failed",
        "$message",
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        backgroundColor: errorColor,
        colorText: bgColor,
      );
    }
  }
}
