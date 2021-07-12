import 'package:elearning_app/routes/routes.dart';
import 'package:elearning_app/views/pages/pages.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: RouteName.classs,
      home: LoginPage(),
      getPages: RoutePage.pages,
    );
  }
}
