import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BerandaController extends GetxController {
  // TextEditingController untuk search bar
  late TextEditingController searchController;

  // Daftar kursus
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Become Profesional UI/UX',
      'price': 'Rp 100.000',
      'rating': 4.3,
      'imageUrl': 'assets/images/course.png',
      'meetings': '12 x Pertemuan'
    },
    {
      'title': '3D Designer',
      'price': 'Rp 100.000',
      'rating': 4.3,
      'imageUrl': 'assets/images/course.png',
      'meetings': '12 x Pertemuan'
    },
    {
      'title': 'Web Developer',
      'price': 'Rp 150.000',
      'rating': 4.3,
      'imageUrl': 'assets/images/course.png',
      'meetings': '12 x Pertemuan'
    },
    {
      'title': 'Digital Marketing',
      'price': 'Rp 100.000',
      'rating': 4.7,
      'imageUrl': 'assets/images/course.png',
      'meetings': '12 x Pertemuan'
    },
    {
      'title': 'Flutter Development',
      'price': 'Rp 250.000',
      'rating': 4.8,
      'imageUrl': 'assets/images/course.png',
      'meetings': '12 x Pertemuan'
    },
    {
      'title': 'Data Science',
      'price': 'Rp 100.000',
      'rating': 4.3,
      'imageUrl': 'assets/images/course.png',
      'meetings': '12 x Pertemuan'
    },
  ];

  // List untuk menyimpan hasil filter (dengan Rx)
  var filteredCourses = <Map<String, dynamic>>[].obs;

  // Variable untuk menyimpan nama pengguna
  var userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();

    // Ambil nama pengguna dari Firebase
    fetchUserName();

    // Awalnya, tampilkan semua kursus
    filteredCourses.value = courses;

    // Menambahkan listener untuk mendeteksi perubahan pada search bar
    searchController.addListener(_filterCourses);
  }

  // Fungsi untuk mengambil nama pengguna dari Firebase
  void fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      userName.value = userDoc.data()?['name'] ??
          'Pengguna'; // Ganti 'name' dengan nama field yang benar
    }
  }

  // Fungsi untuk memfilter kursus
  void _filterCourses() {
    String query = searchController.text.toLowerCase();
    filteredCourses.value = courses.where((course) {
      return course['title'].toLowerCase().contains(query);
    }).toList();
  }

  @override
  void onClose() {
    // Bersihkan controller saat tidak lagi digunakan
    searchController.dispose();
    super.onClose();
  }
}
