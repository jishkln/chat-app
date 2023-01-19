import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'index.dart';

class SigningPage extends GetView<SigningController> {
  const SigningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [_buildLogo(), const Spacer(), _buildLogin()],
          ),
        ),
      ),
    );
  }

  Container _buildLogin() {
    return Container(
      margin: EdgeInsets.only(bottom: 280.h),
      width: 256.w,
      child: Column(
        children: [
          Text(
            "Signing wirh other network",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 50.w, right: 30.h),
            child: ElevatedButton(
              onPressed: () {
                controller.handleSign();
              },
              child: SizedBox(
                  height: 40.h,
                  width: 60.w,
                  child: Center(
                      child: Text(
                    "Google",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ))),
            ),
          )
        ],
      ),
    );
  }

  Center _buildLogo() {
    return Center(
      child: Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 76.w,
              height: 76.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 76.w,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Icon(
                      Icons.chat,
                      size: 76.w,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.w, bottom: 15.h),
              child: Text(
                "Let's chat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
