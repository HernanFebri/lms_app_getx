import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Form key untuk validasi form
  final formKey = GlobalKey<FormState>();

  // TextEditingController untuk input email dan kata sandi
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Obx variable untuk menyimpan state
  var rememberMe = false.obs;
  var isPasswordHidden = true.obs; // Status untuk obsecure password

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
  void login() {
    if (formKey.currentState!.validate()) {
      // Aksi ketika form valid
      Get.snackbar('Login Berhasil', 'Anda berhasil masuk',
          snackPosition: SnackPosition.TOP);

      // Navigasi ke halaman beranda setelah login berhasil
      Get.toNamed('/home'); // Pastikan Anda sudah mendefinisikan rute ini
    }
  }

  // Toggle untuk menyembunyikan/menampilkan password
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
