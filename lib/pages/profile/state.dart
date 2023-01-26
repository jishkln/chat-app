import 'package:chat_application/common/entities/user.dart';
import 'package:get/get.dart';

class ProfileState {
  var head_details = Rx<UserLoginResponceEntity?>(null);
  RxList<MeListItem> meListItem = <MeListItem>[].obs;
}
