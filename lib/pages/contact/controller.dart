import 'dart:convert';
import 'dart:developer';

import 'package:chat_application/common/entities/msg.dart';
import 'package:chat_application/common/entities/user.dart';
import 'package:chat_application/common/store/userstorage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'index.dart';

class ContactController extends GetxController {
  final state = ContactState();
  ContactController();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  void onReady() {
    super.onReady();
    loadAllData();
  }

  goChat(UserData to_userdata) async {
    var from_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: token)
        .where("to_uid", isEqualTo: to_userdata.id)
        .get();

    var to_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: to_userdata.id)
        .where("to_uid", isEqualTo: token)
        .get();

    if (from_messages.docs.isEmpty && to_messages.docs.isEmpty) {
      String profile = await UserStore.to.getProfile();
      UserLoginResponceEntity userData =
          UserLoginResponceEntity.fromJson(jsonDecode(profile));
      var msgData = Msg(
          from_uid: userData.accessToken,
          to_uid: to_userdata.id,
          from_name: userData.displayName,
          to_name: to_userdata.name,
          from_avatar: userData.photoUrl,
          to_avarar: to_userdata.photoUrl,
          last_msg: "",
          last_time: Timestamp.now(),
          msg_num: 0);
      db
          .collection("message")
          .withConverter(
              fromFirestore: Msg.fromFirestore,
              toFirestore: (Msg msg, options) => msg.toFirestore())
          .add(msgData)
          .then((value) {
        Get.toNamed("/chat", parameters: {
          "doc_id": value.id,
          "to_uid": to_userdata.id ?? "",
          "to_name": to_userdata.name ?? "",
          "to_avatar": to_userdata.photoUrl ?? ""
        });
      });
    } else {
      if (from_messages.docs.isNotEmpty) {
        Get.toNamed("/chat", parameters: {
          "doc_id": from_messages.docs.first.id,
          "to_uid": to_userdata.id ?? "",
          "to_name": to_userdata.name ?? "",
          "to_avatar": to_userdata.photoUrl ?? ""
        });
      }
      if (to_messages.docs.isNotEmpty) {
        Get.toNamed("/chat", parameters: {
          "doc_id": to_messages.docs.first.id,
          "to_uid": to_userdata.id ?? "",
          "to_name": to_userdata.name ?? "",
          "to_avatar": to_userdata.photoUrl ?? ""
        });
      }
    }
  }

  loadAllData() async {
    final userDatabase = await db
        .collection("users")
        .where("id", isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userData, options) => userData.toFirestore())
        .get();

    for (var doc in userDatabase.docs) {
      state.contactList.add(doc.data());
    }
  }
}
