import 'package:chat_application/pages/welcome/controller.dart';
import 'package:get/get.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
