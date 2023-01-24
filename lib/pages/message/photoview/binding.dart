import 'package:chat_application/pages/message/photoview/controller.dart';
import 'package:get/get.dart';

class PhotoImageViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }
}
