part of "shared.dart";

const APIHOST = "https://elearning-uin-arraniry.herokuapp.com";
const loginPath = "/account/login";
const registerPath = "/account/register";
const classPath = "/classes";

final apiRegister = Uri.parse(APIHOST + registerPath);
final apiLogin = Uri.parse(APIHOST + loginPath);
final apiClass = Uri.parse(APIHOST + classPath);

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
