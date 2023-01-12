import 'package:chat_application/common/routes/names.dart';
import 'package:chat_application/common/store/configstore.dart';
import 'package:chat_application/pages/welcome/index.dart';
import 'package:chat_application/pages/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final state = WellcomeState();
  WelcomeController();
  changeIndex(int index) async {
    state.index.value = index;
  }

  handleSigning() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAllNamed(AppRoutes.SIGN_IN);
  }
}
