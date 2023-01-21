import 'package:chat_application/common/entities/msg.dart';
import 'package:chat_application/common/store/userstorage.dart';
import 'package:chat_application/pages/message/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
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
}
