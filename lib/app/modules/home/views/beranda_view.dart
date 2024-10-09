import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app_getx/app/utils/app_color.dart';
import '../../../widgets/course_card_widget.dart'; // Pastikan jalur ini benar
import '../controllers/beranda_controller.dart'; // Pastikan jalur ini benar

class BerandaView extends StatelessWidget {
  const BerandaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BerandaController());

    // Mendapatkan tinggi layar
    final screenHeight = MediaQuery.of(context).size.height;

    // Tentukan tinggi elemen yang ada di atas ListView.builder
    final headerHeight =
        200.0; // Estimasi tinggi header, search bar, dan section title
    final bottomPadding =
        80.0; // Tambahkan padding untuk jarak dari bagian bawah (ikon beranda)

    return ListView(
      children: [
        // Header dengan warna latar belakang
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.primary, // Ganti warna sesuai keinginan
            borderRadius:
                BorderRadius.circular(18.0), // Opsional: Radius untuk sudut
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hai, Hernan Febri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Ubah warna teks agar kontras
                ),
              ),
              const SizedBox(height: 10),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Mau belajar apa hari ini?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Ikuti Kursus Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ikuti Kursus',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                // View All action
              },
              child: const Text(
                'Lihat semua',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        // Scrollable Vertical List for Courses
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: screenHeight -
                headerHeight -
                bottomPadding, // Sesuaikan tinggi ListView
            child: ListView.builder(
              physics:
                  const BouncingScrollPhysics(), // Agar kursus saja yang bisa di-scroll
              itemCount: 6, // Jumlah card yang ditampilkan
              itemBuilder: (context, index) {
                // Gunakan card yang telah diperbarui
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16.0), // Jarak antar card
                  child: MyCourseCard(
                    title: index == 0
                        ? 'Become Profesional UI/UX'
                        : index == 1
                            ? '3D Designer'
                            : index == 2
                                ? 'Web Developer'
                                : index == 3
                                    ? 'Digital Marketing'
                                    : index == 4
                                        ? 'Flutter Development'
                                        : 'Data Science',
                    price: index == 2
                        ? 'Rp 150.000'
                        : index == 4
                            ? 'Rp 250.000'
                            : 'Rp 100.000',
                    rating: index == 3
                        ? 4.7
                        : index == 4
                            ? 4.8
                            : 4.3,
                    imageUrl: 'assets/images/course.png',
                    meetings: '12 x Pertemuan',
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
