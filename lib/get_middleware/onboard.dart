
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/authentication_manager.dart';
import 'home_view.dart';
import 'login/login_view.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? const HomeView() : const LoginView();
    });
  }
}
