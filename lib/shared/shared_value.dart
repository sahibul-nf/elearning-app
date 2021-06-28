part of "shared.dart";

var apiHost = "https://elearning-uin-arraniry.herokuapp.com";
var loginPath = "/account/login";
var registerPath = "/account/register";
var classPath = "/classes";

var apiRegister = Uri.parse(apiHost + registerPath);
var apiLogin = Uri.parse(apiHost + loginPath);
var apiClass = Uri.parse(apiHost + classPath);

class DialogController extends GetxController {
  Future<Timer> startTimer(void Function() goTo) async {
    return Timer(Duration(seconds: 3), goTo);
  }

  successDialog(var msg, void Function() goTo) {
    Get.defaultDialog(
      title: '',
      content: CustomDialog(msg: msg),
    );
    startTimer(goTo);
  }
}
