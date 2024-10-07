import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              // Update index ketika halaman berubah
              controller.changePage(index);
            },
            children: [
              // Halaman 1
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/onboarding1.png",
                      filterQuality: FilterQuality.high,
                      height: 300,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Belajar Dari Ahlinya",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Pembelajaran dimentori oleh para ahli pada bidangnya masing-masing",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Halaman 2
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/onboarding2.png",
                      filterQuality: FilterQuality.high,
                      height: 300,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Akses Modul Sepuasnya",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Modul berlimpah yang bebas diakses dimanapun dan kapanpun",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Halaman 3
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/onboarding3.png",
                      filterQuality: FilterQuality.high,
                      height: 300,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Kelas Bersertifikat",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Ikuti kelas , kerjakan tugas dan kuis untuk mendapatkan sertifikat",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Tombol Lewati di top-right
          Positioned(
            top: 50,
            right: 30,
            child: GestureDetector(
              onTap: () {
                Get.offAllNamed('/login');
              },
              child: const Text(
                "Lewati",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Indicator di bawah
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentPage.value == index ? 20 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? Colors.yellow
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              );
            }),
          ),
          // Tombol panah di kanan bawah
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (controller.currentPage.value < 2) {
                  // Jika belum sampai halaman terakhir
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Jika sudah sampai halaman terakhir
                  Get.offAllNamed('/login');
                }
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.yellow,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
