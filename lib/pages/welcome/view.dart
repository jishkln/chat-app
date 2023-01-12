import 'package:chat_application/pages/welcome/controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return SizedBox(
            width: 360.w,
            height: 780.w,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (value) {
                    controller.changeIndex(value);
                  },
                  controller: PageController(
                    initialPage: 0,
                    keepPage: false,
                    viewportFraction: 1,
                  ),
                  pageSnapping: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/wecome/welcom1.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/wecome/welcom2.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/wecome/welcom3.jpg"),
                        ),
                      ),
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Positioned(
                          bottom: 90,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.handleSigning();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                (Colors.amber),
                              ),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              side: MaterialStateProperty.all(
                                const BorderSide(color: Colors.green),
                              ),
                            ),
                            child: const Text(" Set Up "),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
                Positioned(
                  bottom: 60,
                  child: DotsIndicator(
                    position: controller.state.index.value.toDouble(),
                    dotsCount: 3,
                    reversed: false,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
