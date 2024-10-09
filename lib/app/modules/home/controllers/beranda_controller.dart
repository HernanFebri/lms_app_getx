import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController {
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.8);
    // Auto-scroll sudah dihapus, tidak diperlukan lagi Timer.
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
