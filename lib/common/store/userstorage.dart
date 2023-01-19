import 'dart:convert';

import 'package:chat_application/common/entities/user.dart';
import 'package:chat_application/common/services/storeservice.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String token = '';
  final _profile = UserLoginResponceEntity().obs;

  bool get isLogin => _isLogin.value;
  UserLoginResponceEntity get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();

    token = StorageServices.to.getString('STORAGE_USER_TOKEN_KEY');
    var profileOffile =
        StorageServices.to.getString('STORAGE_USER_PROFILE_KEY');
    if (profileOffile.isNotEmpty) {
      _isLogin.value = true;
      _profile(
        UserLoginResponceEntity.fromJson(
          jsonDecode(profileOffile),
        ),
      );
    }
  }

  Future<void> setToken(String value) async {
    await StorageServices.to.setString('STORAGE_USER_TOKEN_KEY', value);
    token = value;
  }

  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    return StorageServices.to.getString('STORAGE_USER_PROFILE_KEY');
  }

  Future<void> saveProfile(UserLoginResponceEntity profile) async {
    _isLogin.value = true;
    StorageServices.to
        .setString('STORAGE_USER_PROFILE_KEY', jsonEncode(profile));

    setToken(profile.accessToken!);
  }

  Future<void> onLogout() async {
    await StorageServices.to.remove('STORAGE_USER_TOKEN_KEY');
    await StorageServices.to.remove('STORAGE_USER_PROFILE_KEY');
    _isLogin.value = false;
  }
}
