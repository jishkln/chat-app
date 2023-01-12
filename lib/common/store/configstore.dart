import 'dart:ui';

import 'package:chat_application/common/services/storeservice.dart';
import 'package:get/get.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;
  // PackageInfo? _platform;
  // String get version => _platform?.version ?? '-';
  bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  Locale locale = const Locale('en', 'US');
  List<Locale> language = [
    const Locale('en', 'US'),
    const Locale('zh', 'CN'),
  ];

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageServices.to.getBool('STORAGE_DEVICE_FIRST_OPEN_KEY');
  }

  // Future<void> getPlatForm() async {
  //   _platform = await PackageInfo.fromPlatform();
  // }

  Future<void> saveAlreadyOpen() {
    return StorageServices.to.setBool('STORAGE_DEVICE_FIRST_OPEN_KEY', true);
  }
}
