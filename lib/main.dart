import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase

  // Cek status login di SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final hasUsedApp = prefs.getBool('hasUsedApp') ??
      false; // Cek apakah aplikasi sudah digunakan sebelumnya

  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn
          ? '/home' // Jika sudah login, arahkan ke halaman home
          : hasUsedApp
              ? AppPages
                  .INITIAL // Jika belum login dan sudah pernah menggunakan aplikasi, arahkan ke halaman login
              : '/splash', // Jika belum pernah menggunakan aplikasi, arahkan ke halaman splash
      getPages: AppPages.routes,
    ),
  );
}
