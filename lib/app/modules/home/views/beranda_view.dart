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

    return Scaffold(
      body: Column(
        children: [
          // Static Header with Fullname and Search Bar
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                bottomLeft: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Obx(() => Text(
                      'Hai, ${berandaController.userName.value}', // Menggunakan nama dari Firebase
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
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
          const SizedBox(height: 20), // Space between header and course list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ikuti Kursus',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Action to view all courses
                  },
                  child: const Text(
                    'Lihat semua',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          // Scrollable Vertical List for Courses
          Expanded(
            child: Obx(() => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: berandaController.filteredCourses.length,
                  itemBuilder: (context, index) {
                    final course = berandaController.filteredCourses[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 16.0),
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
        ],
      ),
    );
  }
}
