import 'package:chat_application/pages/contact/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'index.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const SafeArea(
        child: ContactList(),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
          title: Text(
        "Contact",
        style: TextStyle(
            color: Colors.green, fontSize: 18.sp, fontWeight: FontWeight.w600),
      ));
}
