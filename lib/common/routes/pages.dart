import 'package:chat_application/pages/signing/index.dart';

import 'package:chat_application/pages/welcome/index.dart';
import 'package:get/get.dart';

import 'names.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const Application = AppRoutes.Application;
// static final RouteObserver<Route> = RouteObservers();
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL, page: () => WelcomePage(),
      binding: WelcomeBinding(),
      // middlewares:[ RouteWelcomeMiddleware(priority:1),],
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SigningPage(),
      binding: SigninBinding(),
    ),
  ];
}
