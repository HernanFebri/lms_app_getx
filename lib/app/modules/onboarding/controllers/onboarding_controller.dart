import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  // Menyimpan status sudah melihat onboarding
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'hasUsedApp', true); // Tandai bahwa aplikasi telah digunakan
    Get.offNamed('/login'); // Arahkan ke halaman login
  }

  var currentPage = 0.obs; // Untuk menyimpan halaman yang sedang ditampilkan

  // Fungsi untuk mengubah halaman
  void changePage(int index) {
    currentPage.value = index; // Update halaman saat ini
  }
}
