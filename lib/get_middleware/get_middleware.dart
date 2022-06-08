import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    return authController.authenticated || route == '/login'
        ? null
        : const RouteSettings(name: '/login');
  }

// @override
// GetPage? onPageCalled(GetPage? page) {
//   print('>>> Page ${page?.name} called');
//   print('>>> User ${authController.username} logged');
//   return authController.username != null
//       ? page.copyWith(parameter: {'user': authController.username})
//       : page;
// }
}

void main() {
  Get.put(AuthController());
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => HomePage(),
        middlewares: [GlobalMiddleware()],
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        binding: LoginBinding(),
        middlewares: [GlobalMiddleware()],
      ),
    ],
  ));
}

class AuthController extends GetxController {
  final _authenticated = false.obs;
  final _username = "".obs;

  bool get authenticated => _authenticated.value;

  set authenticated(value) => _authenticated.value = value;

  String get username => _username.value;

  set username(value) => _username.value = value;

  @override
  void onInit() {
    // ever(_authenticated, (value) {
    //   print("ever called");
    //   if (value) {
    //     username = 'Eduardo';
    //   }
    // });
    super.onInit();
  }
}

class OtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtherController());
  }
}

class OtherController extends GetxController {
  @override
  void onInit() {
    print('>>> OtherController started');
    super.onInit();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: Center(
        child: Text('User: ${Get.parameters['user']}'),
      ),
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LoginController());
  }
}

class LoginController extends GetxController {
  var a = false.obs;

  @override
  void onInit() {
    print('>>> LoginController started');
    ever(a, (value) => print("$value has been changed"));
    super.onInit();
  }

  AuthController get authController => Get.find<AuthController>();
}

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  @override
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: RaisedButton(
          child: const Text('Login'),
          onPressed: () {
            controller.authController.authenticated = true;
            Get.offNamed('/home');
          },
        ),
      ),
    );
  }
}

class AnyScreen extends StatelessWidget {
  AnyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("whatever!");
  }
}
