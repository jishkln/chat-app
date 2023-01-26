import 'package:chat_application/pages/app/index.dart';
import 'package:chat_application/pages/message/chat/index.dart';
import 'package:chat_application/pages/contact/index.dart';
import 'package:chat_application/pages/profile/index.dart';
import 'package:chat_application/pages/signing/index.dart';

import 'package:chat_application/pages/welcome/index.dart';
import 'package:get/get.dart';

import '../../pages/message/photoview/index.dart';
import '../middleware/router_welcom.dart';
import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const Application = AppRoutes.Application;
// static final RouteObserver<Route> = RouteObservers();
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SigningPage(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: AppRoutes.Application,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: AppRoutes.Contact,
      page: () => const ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.Me,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.Chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.Photoimgview,
      page: () => const PhotoImageView(),
      binding: PhotoImageViewBinding(),
    ),
  ];
}
