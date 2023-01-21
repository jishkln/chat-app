import 'package:chat_application/common/entities/msg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class MessageState {
  RxList<QueryDocumentSnapshot<Msg>> msgList =
      <QueryDocumentSnapshot<Msg>>[].obs;
}
