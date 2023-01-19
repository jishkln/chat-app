import 'dart:developer';

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
