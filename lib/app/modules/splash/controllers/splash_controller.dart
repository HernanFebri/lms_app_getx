import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Tunda selama 3 detik

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final hasUsedApp = prefs.getBool('hasUsedApp') ?? false;

    if (isLoggedIn) {
      Get.offNamed('/home'); // Arahkan ke halaman home jika sudah login
    } else if (hasUsedApp) {
      Get.offNamed('/login'); // Arahkan ke halaman login jika belum login
    } else {
      Get.offNamed(
          '/onboarding'); // Arahkan ke halaman onboarding jika belum pernah menggunakan aplikasi
    }
  }
}
