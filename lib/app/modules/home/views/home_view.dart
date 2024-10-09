import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_app_getx/app/utils/app_color.dart';
import '../controllers/home_controller.dart';
import 'beranda_view.dart'; // Beranda page
import 'kursusku_view.dart'; // Kursusku page
import 'favorite_view.dart'; // Favorite page
import 'profile_view.dart'; // Profile page

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Observe the selected index to show the correct page
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return const BerandaView();
          case 1:
            return const KursuskuView();
          case 2:
            return const FavoriteView();
          case 3:
            return const ProfileView();
          default:
            return const BerandaView();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Kursusku',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
