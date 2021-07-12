part of 'binds.dart';

class ClassBind extends Bindings {
  @override
  void dependencies() {
    Get.put(ClassController());
  }

}