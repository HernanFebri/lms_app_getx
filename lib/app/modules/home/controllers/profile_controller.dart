import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var fullName = ''.obs; // Menyimpan nama lengkap pengguna

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile(); // Mengambil profil pengguna saat controller diinisialisasi
  }

  void fetchUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid) // Menggunakan uid pengguna yang sedang login
          .get();

      if (userDoc.exists) {
        fullName.value =
            userDoc['name']; // Mengambil nama lengkap dari Firestore
      }
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();

    // Hapus status login di SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Tampilkan Snackbar
    Get.snackbar(
      'Logout Berhasil', // Judul Snackbar
      'Anda telah berhasil logout.', // Pesan Snackbar
      snackPosition: SnackPosition.TOP, // Posisi Snackbar
    );

    // Navigasi ke halaman login setelah logout
    Get.offNamed('/login');
  }
}
