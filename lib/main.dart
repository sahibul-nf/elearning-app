import 'package:elearning_app/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
      getPages: [
        GetPage(
          name: "/login",
          page: () => LoginPage(),
        ),
        GetPage(
          name: "/register",
          page: () => RegisterPage(),
        )
      ],
    );
  }
}