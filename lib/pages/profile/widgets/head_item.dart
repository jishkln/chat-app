import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_application/common/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget headItem(UserLoginResponceEntity item) {
  return Container(
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.w, bottom: 15.w),
    margin: EdgeInsets.only(bottom: 30.w),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0.0, 0.5), blurRadius: 15.0, spreadRadius: 1.0),
        ]),
    child: ListTile(
      onTap: () {},
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          item.photoUrl ?? "",
        ),
      ),
      title: Text(
        item.displayName ?? "",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
      ),
      subtitle: Text(item.accessToken ?? ""),
    ),
  );
}
