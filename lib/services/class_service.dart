part of 'services.dart';

class ClassService extends GetxController {
  DialogController _dialogController = Get.put(DialogController());

  createNewClass({var className}) async {
    var data = {'new_classname': className};

    var req = await http.post(apiClass, body: data);
    var res = jsonDecode(req.body);

    var statusCode = res['Status'];
    var message = res['Message'];

    if (statusCode == 201) {
      _dialogController.successDialog(
        "$message successfully",
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

  classes() {

  }

  classByID({var id}) {

  }
}
