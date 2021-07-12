part of 'routes.dart';

abstract class RouteName {
  static const home = "/home";
  static const login = "/login";
  static const register = "/register";
  static const classs = "/class";
}

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: RouteName.classs,
      page: () => ClassPage(),
      binding: UserBind(),
    ),
  ];
}
