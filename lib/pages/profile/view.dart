import 'package:chat_application/common/entities/user.dart';
import 'package:chat_application/pages/profile/controller.dart';
import 'package:chat_application/pages/profile/widgets/head_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(
        () => CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
              sliver: SliverToBoxAdapter(
                child: controller.state.head_details.value == null
                    ? Container()
                    : headItem(controller.state.head_details.value!),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  var item = controller.state.meListItem[index];
                  return meItem(item);
                }, childCount: controller.state.meListItem.length),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Profile",
        style: TextStyle(
            color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget meItem(MeListItem item) {
    return Container(
      height: 56.h,
      margin: EdgeInsets.only(bottom: 1.w),
      padding: EdgeInsets.only(top: 0.w, left: 15.w, right: 15.w),
      child: InkWell(
        onTap: () {},
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 56.w,
                    child: Image(
                      image: AssetImage(item.icon ?? ""),
                      width: 40.w,
                      height: 40.w,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 14.w),
                    child: Text(
                      item.name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("assets/icons/right-arrow.png"),
                      width: 15.w,
                      height: 15.w,
                    ),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
