import 'dart:developer';

import 'package:chat_application/common/entities/user.dart';
import 'package:chat_application/common/routes/names.dart';
import 'package:chat_application/common/store/userstorage.dart';
import 'package:chat_application/common/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'index.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>['openid'],
);

class SigningController extends GetxController {
  final state = SigninState();
  SigningController();

  final db = FirebaseFirestore.instance;
  Future<void> handleSign() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
        {
          String displayName = user.displayName ?? user.email;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? "";
          UserLoginResponceEntity userProfile = UserLoginResponceEntity();
          userProfile.email = email;
          userProfile.accessToken = id;
          userProfile.displayName = displayName;
          userProfile.photoUrl = photoUrl;

          UserStore.to.saveProfile(userProfile);

          final _googleAuthentication = await user.authentication;
          final _credential = GoogleAuthProvider.credential(
            idToken: _googleAuthentication.idToken,
            accessToken: _googleAuthentication.accessToken,
          );

          await FirebaseAuth.instance.signInWithCredential(_credential);

          var userbase = await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userData, options) =>
                    userData.toFirestore(),
              )
              .where("id", isEqualTo: id)
              .get();
          if (userbase.docs.isEmpty) {
            final data = UserData(
              id: id,
              name: displayName,
              email: email,
              location: "",
              fcmtokn: "",
              addtime: Timestamp.now(),
            );
            await db
                .collection("users")
                .withConverter(
                  fromFirestore: UserData.fromFirestore,
                  toFirestore: (UserData userData, options) =>
                      userData.toFirestore(),
                )
                .add(data);
          }
          toastInfo(msg: "Login sucess");
          Get.offAllNamed(AppRoutes.Application);
        }
      }
    } catch (e) {
      toastInfo(msg: "Login Ertor");
      log(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log("User is loggged out");
      } else {
        log("User is logeged in");
      }
    });
  }
}
