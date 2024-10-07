import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lms_app_getx/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  final SplashController controller = Get.find<SplashController>();
  SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo_splash.png",
                  filterQuality: FilterQuality.high,
                  height: 300,
                ),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Copyright© 2022,\nRebuild by Hernan Febri",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFFC107),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
