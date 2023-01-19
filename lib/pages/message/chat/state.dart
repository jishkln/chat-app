import 'package:chat_application/common/entities/msgcontent.dart';
import 'package:get/get.dart';

class ChatState {
  RxList<Msgcontent> msgcontent = <Msgcontent>[].obs;
  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_location = "".obs;
}
