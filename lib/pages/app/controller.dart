import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  ApplicationController();

  late final List<String> tabiTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handlePageChange(int index) {
    state.page = index;
  }

  void handleNarBarOnTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabiTitles = ['Chat', 'Contact', 'Profile'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.message,
            color: Colors.blueGrey,
          ),
          activeIcon: Icon(
            Icons.message,
            color: Colors.red,
          ),
          label: 'Chat'),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.contact_page,
            color: Colors.blueGrey,
          ),
          activeIcon: Icon(
            Icons.message,
            color: Colors.red,
          ),
          label: 'Contact'),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.blueGrey,
        ),
        activeIcon: Icon(
          Icons.message,
          color: Colors.red,
        ),
        label: 'Profile',
      )
    ];
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
