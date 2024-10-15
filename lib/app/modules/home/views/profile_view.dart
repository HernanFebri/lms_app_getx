import 'package:flutter/material.dart';
import 'package:lms_app_getx/app/utils/app_color.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart'; // Import ProfileController

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController =
        Get.put(ProfileController()); // Menginisialisasi ProfileController

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container untuk space dan warna latar belakang
            Container(
              height: 40, // Mengatur tinggi untuk space
              color: AppColors.primary, // Mengatur warna menjadi primary
            ),
            // Header dengan warna latar belakang dan border bawah
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0), // Mengurangi padding vertikal
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: Colors
                        .white, // Ganti dengan warna border sesuai keinginan
                    width: 2, // Ketebalan border
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center alignment
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.background,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ), // Ganti dengan gambar profil Anda
                      ),
                      const SizedBox(width: 15), // Mengurangi ukuran spacing
                      // Flexible untuk menghindari overflow
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                                  profileController.fullName.value,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  softWrap: true, // Mengizinkan teks wrap
                                )),
                            // Fullname tanpa overflow handling agar turun ke baris berikutnya
                            const Text(
                              'Mentee',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 10), // Mengurangi jarak antara header dan ListTile
            ListTile(
              title: const Text(
                'Pengaturan Akun',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                children: [
                  ListTile(
                    title: const Text('Ubah Profil'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Ubah Tema'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Lainnya',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                children: [
                  ListTile(
                    title: const Text('Versi Aplikasi'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Tentang Kami'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Keluar'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Menampilkan dialog konfirmasi
                      Get.defaultDialog(
                        title: 'Konfirmasi',
                        middleText: 'Apakah Anda yakin ingin keluar?',
                        confirm: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                AppColors.primary, // Warna teks tombol
                          ),
                          onPressed: () {
                            profileController
                                .logout(); // Memanggil fungsi logout
                            Get.back(); // Menutup dialog setelah logout
                          },
                          child: const Text('Ya'),
                        ),
                        cancel: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors
                                .primary, // Warna teks tombol untuk pembatalan
                          ),
                          onPressed: () {
                            Get.back(); // Menutup dialog
                          },
                          child: const Text('Tidak'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
