import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Controllers untuk form input
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // State untuk mengatur visibilitas password
  var isPasswordHidden = true.obs;

  // State untuk persetujuan checkbox
  var agreeTerms = false.obs;

  // FormKey untuk validasi form
  final formKey = GlobalKey<FormState>();

  // Fungsi untuk toggle visibilitas password
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Validasi input nama
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  // Validasi input email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    // RegEx untuk validasi email yang benar
    if (!GetUtils.isEmail(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  // Validasi input password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Kata sandi harus minimal 6 karakter';
    }
    return null;
  }

  // Validasi input konfirmasi password
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi kata sandi tidak boleh kosong';
    }
    if (value != passwordController.text) {
      return 'Kata sandi tidak cocok';
    }
    return null;
  }

  // Fungsi untuk melakukan register
  void register() {
    if (!agreeTerms.value) {
      Get.snackbar('Peringatan', 'Anda harus setuju dengan persyaratan kami',
          snackPosition: SnackPosition.TOP);
      return;
    }

    if (formKey.currentState!.validate()) {
      // Proses register di sini (misalnya kirim data ke server)
      Get.snackbar('Sukses', 'Registrasi berhasil!',
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  void onClose() {
    // Dispose controller ketika tidak digunakan
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
