import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../routes/app_pages.dart';
class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    // 加入 AuthService
    Future.delayed(const Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));

    return const RouteSettings(name: AppRoutes.Login);
  }
}
