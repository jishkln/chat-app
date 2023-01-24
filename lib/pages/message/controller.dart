import 'dart:developer';

import 'package:chat_application/common/entities/msg.dart';
import 'package:chat_application/common/store/userstorage.dart';
import 'package:chat_application/common/utils/http.dart';
import 'package:chat_application/pages/message/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessageController extends GetxController {
  MessageController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  final MessageState state = MessageState();
  var listener;
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );
  @override
  void onReady() {
    super.onReady();
    getFcmtoken();
  }

  void onRefresh() {
    asyncLoadAllData().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
      print("${state.msgList[0]}");
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    asyncLoadAllData().then((_) {
      refreshController.loadComplete();
    }).catchError((_) {
      refreshController.loadFailed();
    });
  }

  asyncLoadAllData() async {
    var from_message = await db
        .collection("message")
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore(),
        )
        .where("from_uid", isEqualTo: token)
        .get();
    var to_message = await db
        .collection("message")
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore(),
        )
        .where("to_uid", isEqualTo: token)
        .get();

    state.msgList.clear();
    if (from_message.docs.isNotEmpty) {
      state.msgList.assignAll(from_message.docs);
    }
    if (to_message.docs.isNotEmpty) {
      state.msgList.assignAll(to_message.docs);
    }
  }

  // getUserLocation() async {
  //   try {
  //     final location = await Location().getLocation();
  //     String adderss = "${location.latitude},${location.longitude}";
  //     String url =
  //         "https://maps.googleapis.com/maps/api/geocode/json? address=${adderss}&key= ";
  //     var responce =await HttpUtils().get(url);

  //     // MyLocation myLocation = MyLocation.fromJson(responce);
  //   } catch (e) {
  //     log("error message $e");
  //   }
  // }

  getFcmtoken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      var user =
          await db.collection("users").where("id", isEqualTo: token).get();
      if (user.docs.isNotEmpty) {
        var doc_id = user.docs.first.id;
        await db.collection("users").doc(doc_id).update({"fcmtoken": fcmToken});
      }
    }
  }
}
