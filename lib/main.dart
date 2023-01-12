import 'package:chat_application/common/routes/names.dart';
import 'package:chat_application/common/routes/pages.dart';
import 'package:chat_application/common/services/storeservice.dart';
import 'package:chat_application/common/store/configstore.dart';
import 'package:chat_application/common/store/userstorage.dart';
import 'package:chat_application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageServices>(() => StorageServices().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppRoutes.INITIAL,
          getPages: AppPages.routes,
        );
      }),
    );
  }
}
