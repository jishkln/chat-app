import 'package:chat_application/pages/signing/index.dart';
import 'package:get/get.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigningController>(() => SigningController());
  }
}
