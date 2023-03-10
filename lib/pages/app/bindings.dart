import 'package:chat_application/pages/app/index.dart';
import 'package:chat_application/pages/contact/index.dart';
import 'package:chat_application/pages/message/controller.dart';
import 'package:chat_application/pages/profile/controller.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
