import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

class LoginController extends GetxController {
  // Form key untuk validasi form
  final formKey = GlobalKey<FormState>();

  // TextEditingController untuk input email dan kata sandi
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Obx variable untuk menyimpan state
  var rememberMe = false.obs; // Status untuk menyimpan email dan kata sandi
  var isPasswordHidden = true.obs; // Status untuk obsecure password

  // Inisialisasi controller
  @override
  void onInit() {
    super.onInit();
    loadCredentials(); // Memuat kredensial jika tersedia
  }

  // Memuat kredensial dari SharedPreferences
  Future<void> loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    emailController.text = prefs.getString('savedEmail') ?? '';
    passwordController.text = prefs.getString('savedPassword') ?? '';
    rememberMe.value =
        prefs.getBool('rememberMe') ?? false; // Muat status checkbox
  }

  // Validasi email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    // Regex untuk validasi format email
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Masukkan email yang valid';
    }
    return null;
  }

  // Validasi password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Kata sandi minimal 6 karakter';
    }
    return null;
  }

  // Aksi login
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        // Melakukan autentikasi menggunakan Firebase
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Memeriksa apakah email sudah diverifikasi
        if (userCredential.user != null &&
            !userCredential.user!.emailVerified) {
          Get.snackbar(
              'Peringatan', 'Silakan verifikasi email Anda terlebih dahulu.',
              snackPosition: SnackPosition.TOP);
          return; // Keluar dari fungsi jika email belum diverifikasi
        }

        // Simpan status login di SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        // Simpan email dan kata sandi jika checkbox diaktifkan
        if (rememberMe.value) {
          await prefs.setString('savedEmail', emailController.text.trim());
          await prefs.setString(
              'savedPassword', passwordController.text.trim());
          await prefs.setBool('rememberMe', true);
        } else {
          // Hapus email dan kata sandi dari SharedPreferences jika tidak diingat
          await prefs.remove('savedEmail');
          await prefs.remove('savedPassword');
          await prefs.setBool('rememberMe', false);
        }

        // Aksi ketika form valid
        Get.snackbar('Login Berhasil', 'Anda berhasil masuk',
            snackPosition: SnackPosition.TOP);

        // Navigasi ke halaman beranda setelah login berhasil
        Get.offNamed('/home'); // Ganti Get.toNamed dengan Get.offNamed
      } on FirebaseAuthException catch (e) {
        // Menangani kesalahan autentikasi
        if (e.code == 'user-not-found') {
          Get.snackbar('Login Gagal', 'Pengguna tidak ditemukan.',
              snackPosition: SnackPosition.TOP);
        } else if (e.code == 'wrong-password') {
          Get.snackbar('Login Gagal', 'Kata sandi yang Anda masukkan salah.',
              snackPosition: SnackPosition.TOP);
        } else {
          Get.snackbar('Login Gagal', 'Terjadi kesalahan, silakan coba lagi.',
              snackPosition: SnackPosition.TOP);
        }
      } catch (e) {
        Get.snackbar('Login Gagal', e.toString(),
            snackPosition: SnackPosition.TOP);
      }
    }
  }

  // Aksi logout
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('savedEmail'); // Hapus email
    await prefs.remove('savedPassword'); // Hapus password
    await prefs.setBool('isLoggedIn', false); // Atur status logout

    // Navigasi kembali ke halaman login
    Get.offNamed('/login');
  }

  // Toggle untuk menyembunyikan/menampilkan password
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
