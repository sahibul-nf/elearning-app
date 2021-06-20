import 'package:elearning_app/models/user.dart';
import 'package:elearning_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  User user = Get.put(User());
  Iteration iter = Get.put(Iteration());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}