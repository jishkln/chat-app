import 'package:chat_application/pages/message/photoview/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoImageView extends GetView<PhotoImageViewController> {
  const PhotoImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child:
            PhotoView(imageProvider: NetworkImage(controller.state.url.value)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 2.0,
        ),
      ),
      title: Text(
        "PhotoView",
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.sp),
      ),
    );
  }
}
