import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:elearning_app/controllers/controllers.dart';
import 'package:elearning_app/models/models.dart';
import 'package:elearning_app/services/services.dart';
import 'package:elearning_app/shared/shared.dart';
import 'package:elearning_app/views/widgets/widgets.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

part 'register_page.dart';
part 'login_page.dart';
part 'home_page.dart';