part of 'services.dart';

class Iteration extends GetxController {

  User u = Get.put(User());
  
  void ii() => u.i.value++;
}
