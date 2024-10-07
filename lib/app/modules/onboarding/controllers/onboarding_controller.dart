import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs; // Gunakan Rx untuk membuatnya reaktif

  // Fungsi untuk mengubah halaman
  void changePage(int index) {
    currentPage.value = index;
  }
}
