import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app_getx/app/utils/app_color.dart';
import '../../../widgets/course_card_widget.dart';
import '../controllers/beranda_controller.dart';

class BerandaView extends StatelessWidget {
  const BerandaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BerandaController berandaController = Get.put(BerandaController());

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
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Hai, Hernan Febri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              // Search Bar
              TextField(
                controller: berandaController.searchController,
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
            height: screenHeight - headerHeight - bottomPadding,
            child: Obx(() => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: berandaController.filteredCourses.length,
                  itemBuilder: (context, index) {
                    final course = berandaController.filteredCourses[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: MyCourseCard(
                        title: course['title'],
                        price: course['price'],
                        rating: course['rating'],
                        imageUrl: course['imageUrl'],
                        meetings: course['meetings'],
                      ),
                    );
                  },
                )),
          ),
        ),
      ],
    );
  }
}
