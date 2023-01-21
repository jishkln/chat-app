import 'package:chat_application/pages/contact/index.dart';
import 'package:chat_application/pages/message/view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'index.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNAvigationBar(),
      body: SafeArea(
        child: _buildPageView(),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChange,
      children: [
        const MessagePage(),
        const ContactPage(),
        Container(
          child: const Text("Profile"),
        )
      ],
    );
  }

  Widget _bottomNAvigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handleNarBarOnTap,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
