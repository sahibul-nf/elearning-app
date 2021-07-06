part of 'controllers.dart';

class ClassController extends GetxController {
  var classID = ''.obs;

  final userC = Get.find<UserController>();

  createClass(
    var className,
    var token,
  ) {
    ClassService()
        .createNewClass(
      className: className,
      token: token,
    )
        .then((value) {
      print(value.body);
      // print(value.headers);
    });
  }
}
