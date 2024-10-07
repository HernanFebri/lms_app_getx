import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // Menunggu selama 3 detik sebelum berpindah ke Onboarding
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.ONBOARDING); // Mengarahkan ke halaman onboarding
      },
    );
  }
}
