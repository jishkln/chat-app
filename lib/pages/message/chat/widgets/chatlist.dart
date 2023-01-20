import 'package:chat_application/pages/message/chat/controller.dart';
import 'package:chat_application/pages/message/chat/widgets/chat_left_item.dart';
import 'package:chat_application/pages/message/chat/widgets/chat_right_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatList extends GetView<ChatController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.only(bottom: 50.h),
          child: CustomScrollView(
            reverse: true,
            controller: controller.msgScrolling,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var item = controller.state.msgcontentlist[index];
                      if (controller.user_id == item.uid) {
                        return chatRightItem(item);
                      }
                      return chatLeftItem(item);
                    },
                    childCount: controller.state.msgcontentlist.length,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
