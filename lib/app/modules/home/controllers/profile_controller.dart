import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  // Aksi logout
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();

    // Hapus status login di SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigasi ke halaman login setelah logout
    Get.offNamed('/login');
  }
}
