import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_application/common/entities/user.dart';
import 'package:chat_application/pages/contact/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var item = controller.state.contactList[index];
                  return Container(
                    child: buildListItem(item),
                  );
                },
                childCount: controller.state.contactList.length,
              )),
            )
          ],
        ));
  }

  Widget buildListItem(UserData item) {
    return Container(
      padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, left: 0.w, right: 15.w),
              child: SizedBox(
                width: 54.w,
                height: 54.w,
                child: CachedNetworkImage(imageUrl: "${item.photoUrl}"),
              ),
            ),
            Container(
              width: 250.w,
              padding: EdgeInsets.only(
                  top: 15.w, left: 0.w, right: 0.w, bottom: 0.w),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xffe5efe5),
                  ),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 42.w,
                    child: Text(
                      item.name ?? "Unknown",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
